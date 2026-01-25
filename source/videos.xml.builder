xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom",
         "xmlns:media" => "http://search.yahoo.com/mrss/" do
  site_url = "http://paperswelove.org/"

  xml.title "Papers We Love - Videos"
  xml.subtitle "Video presentations from Papers We Love meetups around the world."
  xml.id "#{site_url}videos/"
  xml.link "href" => "#{site_url}videos/"
  xml.link "href" => "#{site_url}videos.xml", "rel" => "self", "type" => "application/atom+xml"
  xml.author { xml.name "Papers We Love" }

  # Get videos sorted by date, take 50 most recent
  videos = data.videographer.sort_by { |v|
    v[:published_at] || v['published_at'] || '1970-01-01'
  }.reverse.first(50)

  # Set feed updated time to most recent video
  if videos.any?
    most_recent = videos.first
    date_str = most_recent[:published_at] || most_recent['published_at']
    xml.updated Time.parse(date_str.to_s).iso8601 rescue Time.now.iso8601
  else
    xml.updated Time.now.iso8601
  end

  videos.each do |video|
    title = video[:title] || video['title']
    youtube_id = video[:youtube_id] || video['youtube_id']
    description = video[:description] || video['description'] || ''
    published_at = video[:published_at] || video['published_at']
    thumbnail_url = video[:thumbnail_url] || video['thumbnail_url']

    # Generate slug (matches config.rb logic)
    slug = title.to_s
                .downcase
                .gsub(/[^\w\s-]/, '')
                .gsub(/\s+/, '-')
                .gsub(/-+/, '-')
                .gsub(/^-|-$/, '')
                .slice(0, 80)

    video_url = "#{site_url}videos/#{slug}/"
    youtube_url = "https://www.youtube.com/watch?v=#{youtube_id}"

    xml.entry do
      xml.title title
      xml.id video_url
      xml.link "rel" => "alternate", "href" => video_url, "type" => "text/html"

      if published_at
        begin
          pub_time = Time.parse(published_at.to_s)
          xml.published pub_time.iso8601
          xml.updated pub_time.iso8601
        rescue
          xml.published Time.now.iso8601
          xml.updated Time.now.iso8601
        end
      end

      xml.author { xml.name "Papers We Love" }

      # Media RSS thumbnail
      if thumbnail_url && !thumbnail_url.empty?
        xml.tag!("media:thumbnail", "url" => thumbnail_url, "width" => "480", "height" => "360")
      end

      # Content with thumbnail and description
      content_html = ""
      if thumbnail_url && !thumbnail_url.empty?
        content_html << %(<p><a href="#{youtube_url}"><img src="#{thumbnail_url}" alt="#{title}" /></a></p>)
      end
      content_html << %(<p><a href="#{youtube_url}">Watch on YouTube</a></p>)
      content_html << %(<div>#{description.gsub("\n", "<br/>")}</div>) unless description.empty?

      xml.content content_html, "type" => "html"
    end
  end
end
