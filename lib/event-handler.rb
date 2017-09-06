# coding: utf-8
require 'sanitize'

# Event parsing functions for Meetup.com API data

def weight_chapters(data)
  chapters = data.chapters
  chapters.keys.map do |chapter|
    chapter_json = data[chapter]
    result = {:id => chapter, :weight => 0, :title => chapters[chapter]['title']}
    unless chapter_json.nil? || chapter == "seoul"
      result[:weight] = chapter_json.keys.select { |id| !is_out_of_range(chapter_json[id]['time']) }.count
    end
    result
  end
end

def is_out_of_range(d)
  o = d || 0
  t = Time.at(o / 1000)
  n = Time.now
  t.year > n.year || ((t.year == n.year) && (t.month > n.month))
end

# Sort the events hash by time and filter out any events happening in the future
def process_event_hash(events)
  unless events.nil?
    events
      .values
      .reject { |i| i.nil? || is_out_of_range(i.time)}
      .sort_by! { |i| i.time }
      .reverse
  end
end


# Rever chronologically sort events (newest on top)
def sort_events(events)
  events.sort_by { |e| e['time'] }.reverse
end

# Strip BS from titles
def clean_title(title)
  title.gsub(/[\#=>\d]|Papers We Love|PWL/, '').sub(/[-{1}]/, '').sub(/\(part \d?( of \d?)?\)/i, '').strip
end

# Build up address and map strings for meta div
def build_address(venue)
  vname = venue['name']
  add1 = venue['address1']
  add2 = venue['address2']
  city = venue['city']
  postal_code = venue['postalCode']
  address = [add1, add2].reject { |i| i.nil? }.join ', '
  unless city.nil?
    address = "#{address}, #{city} #{postal_code}"
  end
  unless vname.nil?
    address = "#{vname} - #{address} #{postal_code}"
  end

  gmap = "#{add1} #{add2} #{city} #{postal_code}".squeeze(' ').gsub(/[\s]/, '+')
  glink = "<a class=\"event-map\" href=\"https://www.google.com/maps/search/#{gmap}\">Map</a>"

  [address, glink]
end

# Parse event date with utc offset
def event_date(event)
  time = event['time'] || 0
  offset = event['utcOffset'] || 0
  Time.at((time + offset) / 1000).utc.to_datetime
end

def format_date(datetime)
  datetime.strftime('%F %I:%M%P')
end

# We truncate the descriptions at 1000 chars, clean up the HTML
# and add a read more link
def filter_description(text, readmore, url)
  if text
    _text = Sanitize.fragment(text[0...1000] + '&hellip;', Sanitize::Config::RELAXED)
    if readmore && url
      _text = "#{_text} <p><a class=\"event-read-more\" href=\"#{url}\">#{readmore}</a></p>"
    end
    _text
  else
    "<p><a class=\"event-read-more\" href=\"#{url}\">#{readmore}</a></p>"
  end
end

# Look for a photos with a _SPEAKER_ caption
def find_speaker(photos)
  photos.select { |p| p.has_key?('caption') && p['caption'] == '_SPEAKER_' }
end

# If we don't have a designated speaker photos, then pick one at random
def event_photo(photos)
  speakers = find_speaker(photos)
  if speakers.empty?
    photo = photos.shuffle[0]
  else
    photo = speakers[0]
  end
  src = photo['photo_link']
  name = photo['member']['name']
  "<img src=\"#{src}\" class=\"event-photo\" alt=\"Photo by #{name}\" />"
end

# If we have events then sort them, otherwise empty array
def check_events(chapter)
  if chapter.nil?
    []
  else
    sort_events(chapter.events)
  end
end

# Pack all the information into a hash and send back
def process_fields(event)
  h = Hash.new
  h[:url] = event['url']
  h[:event_title] = event['title']

  h[:city] = ''

  if event['venue'].nil?
    address = ''
    glink = ''
  else
    address, glink = build_address(event['venue'])
    h[:city] = event['venue']['city']
  end

  h[:address] = address
  h[:glink] = glink

  if event['description'].nil?
    h[:desc] = ''
  else
    h[:desc] = filter_description(event['description'],
                                  'Read more about this Meetup',
                                  h[:url])
  end

  h[:photo] = event['photos']
  h[:time] = event_date(event)
  h[:formatted_time] = format_date(h[:time])

  result = h

  if h[:city] == "Seoul" || h[:city] == "서울"
    if /papers we love/.match(h[:event_title].downcase).nil?
      result = nil
    end
  end

  if !h[:city] || h[:city].empty?
    result = nil
  end

  result
end
