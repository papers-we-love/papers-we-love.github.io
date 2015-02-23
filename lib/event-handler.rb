require 'sanitize'

# Event parsing functions for Meetup.com API data

# Rever chronologically sort events (newest on top)
def sort_events(events)
  events.sort_by { |e| e['time'] }.reverse
end

# Strip BS from titles
def clean_title(title)
  title.gsub(/[\#=>\d]|Papers We Love|PWL/, '').sub(/[-{1}]/, '')
end

# Build up address and map strings for meta div
def build_address(venue)
  vname = venue['name']
  add1 = venue['address_1']
  add2 = venue['address_2']
  city = venue['city']
  address = [add1, add2].reject { |i| i.nil? }.join ', '
  unless city.nil?
    address = "#{address}, #{city}"
  end
  unless vname.nil?
    address = "#{vname} - #{address}"
  end

  gmap = "#{add1} #{add2} #{city}".squeeze(' ').gsub(/[\s]/, '+')
  glink = "<a class=\"event-map\" href=\"https://www.google.com/maps/search/#{gmap}\">Map</a>"

  [address, glink]
end

# Humanize the dates
def event_date(time)
  Time.at(time / 1000).to_datetime.strftime('%F %I:%M%P')
end

# We truncate the descriptions at 1000 chars, clean up the HTML
# and add a read more link
def filter_description(text, readmore, url)
  _text = Sanitize.fragment(text[0...1000] + '&hellip;', Sanitize::Config::RELAXED)
  if readmore && url
    _text = "#{_text} <p><a class=\"event-read-more\" href=\"#{url}\">#{readmore}</a></p>"
  end
  _text
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
  h[:url] = event['event_url']
  h[:event_title] = clean_title(event['name'])

  if event['venue'].nil?
    address = ''
    glink = ''
  else
    address, glink = build_address(event['venue'])
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

  photo = ''
  if event['photos']
    img = event_photo(event['photos'])
    photo = "<a class=\"event-photo-link\" href=\"#{h[:url]}\">#{img}</a>"
  end
  h[:photo] = photo
  h[:time] = event_date(event["time"])
  h
end
