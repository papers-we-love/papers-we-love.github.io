xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  site_url = "https://paperswelove.org/"

  xml.title "Papers We Love - Papers"
  xml.subtitle "Computer science papers from the Papers We Love repository."
  xml.id "#{site_url}papers/"
  xml.link "href" => "#{site_url}papers/"
  xml.link "href" => "#{site_url}papers_feed.xml", "rel" => "self", "type" => "application/atom+xml"
  xml.author { xml.name "Papers We Love" }

  # Load and sort papers by created_on descending, take 100 most recent
  papers_dir = File.join(app.root, 'data', 'json', 'papers')
  papers = Dir.glob(File.join(papers_dir, '*.json')).map do |f|
    JSON.parse(File.read(f), symbolize_names: true)
  end.sort_by { |p| p[:created_on].to_s }.reverse.first(100)

  if papers.any?
    xml.updated Time.parse(papers.first[:created_on].to_s).iso8601 rescue Time.now.iso8601
  else
    xml.updated Time.now.iso8601
  end

  papers.each do |paper|
    slug = paper[:title].to_s
               .downcase
               .gsub(/[^\w\s-]/, '')
               .gsub(/\s+/, '-')
               .gsub(/-+/, '-')
               .gsub(/^-|-$/, '')
               .slice(0, 50)
    slug = "#{slug}-#{paper[:uuid].to_s[0..7]}"
    paper_url = "#{site_url}papers/#{slug}/"

    xml.entry do
      xml.title paper[:title]
      xml.id paper_url
      xml.link "rel" => "alternate", "href" => paper_url, "type" => "text/html"

      if paper[:created_on]
        begin
          created_time = Time.parse(paper[:created_on].to_s)
          xml.published created_time.iso8601
          xml.updated created_time.iso8601
        rescue
          xml.published Time.now.iso8601
          xml.updated Time.now.iso8601
        end
      end

      xml.author do
        if paper[:authors] && !paper[:authors].empty?
          xml.name paper[:authors].join(', ')
        else
          xml.name "Papers We Love"
        end
      end

      content_html = ""
      if paper[:abstract] && !paper[:abstract].empty?
        content_html << "<h3>Abstract</h3><p>#{paper[:abstract]}</p>"
      end
      if paper[:raw_url] && !paper[:raw_url].empty?
        content_html << %(<p><a href="#{paper[:raw_url]}">Read the paper</a></p>)
      end

      xml.content content_html, "type" => "html"
    end
  end
end
