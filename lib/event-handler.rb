require 'sanitize'

def sort_events(events)
  events.sort_by { |e| e['time'] }.reverse
end

def clean_title(title)
  title.gsub(/[\#=>\d]|Papers We Love|PWL/, '').sub(/[-{1}]/, '')
end

def build_address(venue)
  vname = venue['name'] || nil
  add1 = venue['address_1'] || nil
  add2 = venue['address_2'] || nil
  city = venue['city'] || nil
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

def event_date(time)
  Time.at(time / 1000).to_datetime.strftime('%F %I:%M%P')
end

def filter_description(text, readmore, url)
  _text = Sanitize.fragment(text[0...1000] + '&hellip;', Sanitize::Config::RELAXED)
  if readmore && url
    _text = "#{_text} <p><a class=\"event-read-more\" href=\"#{url}\">#{readmore}</a></p>"
  end
  _text
end

def event_photo(photos)
  photo = photos.shuffle[0]
  src = photo['photo_link']
  name = photo['member']['name']
  "<img src=\"#{src}\" class=\"event-photo\" alt=\"Photo by #{name}\" />"
end

def check_events(chapter)
  if chapter.nil?
    []
  else
    sort_events(chapter.events)
  end
end

def process_fields(event)
  h = Hash.new
  h[:url] = event['event_url']
  h[:event_title] = clean_title(event['name'])

  address, glink = build_address(event['venue'])

  h[:address] = address
  h[:glink] = glink
  h[:desc] = filter_description(event['description'],
                                'Read more about this Meetup',
                                h[:url])
  photo = ''
  if event['photos']
    img = event_photo(event['photos'])
    photo = "<a class=\"event-photo-link\" href=\"#{h[:url]}\">#{img}</a>"
  end
  h[:photo] = photo
  h[:time] = event_date(event["time"])
  h
end
