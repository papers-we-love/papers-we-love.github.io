require 'lib/event-handler.rb'
require 'lib/build_cleaner'
require 'ostruct'

## We have to blow away the /build folder before deploys
configure :build do
  activate :build_cleaner
end

###
# Blog settings
###

Time.zone = "UTC"

activate :blog do |blog|
  blog.permalink = "{year}/{category}/{title}.html"

  blog.layout = "article"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"

  # Create Category Archive pages
  blog.custom_collections = {
    category: {
      link: '/categories/{category}.html',
      template: '/category.html'
    }
  }
end

page "/feed.xml", layout: false
page "/videos.xml", layout: false

# Sitemap configuration
set :url_root, 'https://paperswelove.org'

activate :search_engine_sitemap,
  default_priority: 0.5,
  default_change_frequency: "monthly"

page '/pwlconf2017/*', layout: 'pwlconf'

# OpenGraph tags are now handled manually in layouts

###
# Helpers
###
helpers do
  def category_list
    sitemap.resources.group_by {|p| p.data["category"] }.map do |category, pages|
      { :category => category, :pages => pages }
    end
  end

  # Auto-link URLs in text
  def auto_link(text)
    return '' if text.nil? || text.empty?
    url_regex = %r{(https?://[^\s<>\[\]"']+)}
    text.gsub(url_regex) do |url|
      # Clean up trailing punctuation that's likely not part of the URL
      clean_url = url.sub(/[.,;:!?\)]+$/, '')
      trailing = url[clean_url.length..-1] || ''
      %(<a href="#{clean_url}" target="_blank" rel="noopener">#{clean_url}</a>#{trailing})
    end
  end

  # Format text with paragraphs and auto-linked URLs (no escaping)
  def format_description(text)
    return '' if text.nil? || text.empty?
    # First, escape HTML entities for safety (but not our auto-generated links)
    escaped = text.gsub('&', '&amp;').gsub('<', '&lt;').gsub('>', '&gt;')
    # Auto-link URLs
    linked = auto_link_escaped(escaped)
    # Convert double newlines to paragraphs, single newlines to <br>
    paragraphs = linked.split(/\n\n+/).map { |p| "<p>#{p.gsub(/\n/, '<br>')}</p>" }.join("\n")
    paragraphs
  end

  # Auto-link URLs in already-escaped text
  def auto_link_escaped(text)
    return '' if text.nil? || text.empty?
    url_regex = %r{(https?://[^\s&<>\[\]"']+)}
    text.gsub(url_regex) do |url|
      clean_url = url.sub(/[.,;:!?\)]+$/, '')
      trailing = url[clean_url.length..-1] || ''
      %(<a href="#{clean_url}" target="_blank" rel="noopener">#{clean_url}</a>#{trailing})
    end
  end

  # Get all videos as entry objects for mixing with blog articles
  def video_entries
    return @video_entries if @video_entries

    @video_entries = data.videographer.map do |v|
      title = v[:title] || v['title']
      slug = slugify(title)
      date_str = v[:published_at] || v['published_at']
      date = begin
        Date.parse(date_str.to_s)
      rescue
        Date.today
      end

      OpenStruct.new(
        title: title,
        date: date,
        url: "/videos/#{slug}/",
        category: 'video',
        is_video: true,
        youtube_id: v[:youtube_id] || v['youtube_id'],
        description: v[:description] || v['description'] || ''
      )
    end
  end

  # Get combined blog articles and videos, sorted by date
  def combined_entries(limit = nil)
    articles = blog.articles.map do |a|
      OpenStruct.new(
        title: a.title,
        date: a.date.to_date,
        url: a.url,
        category: a.data.category,
        is_video: false,
        article: a
      )
    end

    all_entries = (articles + video_entries).sort_by { |e| e.date }.reverse

    limit ? all_entries.first(limit) : all_entries
  end

  # Convert a title to a URL-friendly slug
  def slugify(title)
    title.to_s
         .downcase
         .gsub(/[^\w\s-]/, '')  # Remove non-word characters except spaces and hyphens
         .gsub(/\s+/, '-')       # Replace spaces with hyphens
         .gsub(/-+/, '-')        # Replace multiple hyphens with single
         .gsub(/^-|-$/, '')      # Remove leading/trailing hyphens
         .slice(0, 80)           # Limit length
  end

  # Parse tags from comma-separated string and add defaults
  def parse_video_tags(tags_string)
    tags = ['meetup', 'video']
    if tags_string && !tags_string.empty?
      tags_string.split(',').each do |tag|
        slug = slugify(tag.strip)
        tags << slug unless slug.empty? || tags.include?(slug)
      end
    end
    tags.uniq
  end

  # Parse date from published_at timestamp
  def parse_video_date(published_at)
    return Date.today.strftime('%Y-%m-%d') unless published_at
    Date.parse(published_at.to_s).strftime('%Y-%m-%d')
  rescue
    Date.today.strftime('%Y-%m-%d')
  end
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Load Chapters YAML
@chapters = YAML.load_file('source/chapters.yml', permitted_classes: [Symbol])

###
# Helpers
###

# Directory indexes
activate :directory_indexes

# Chapter pages (defined after directory_indexes)
# Use /index.html suffix so directory_indexes creates proper directories
data.chapters.keys.reject { |i| i.nil? }.each do |chapter|
  proxy "/chapter/#{chapter}/index.html", "/chapter.html", locals: { chapter: chapter, events: data[chapter] }, ignore: true
end

# Chapter index
proxy "/chapter/index.html", "/chapter_index.html", locals: { chapters: @chapters }, ignore: true

# Video pages (generated from videographer.json)
# Helper methods for video processing (defined at config level for proxy generation)
def config_slugify(title)
  title.to_s
       .downcase
       .gsub(/[^\w\s-]/, '')
       .gsub(/\s+/, '-')
       .gsub(/-+/, '-')
       .gsub(/^-|-$/, '')
       .slice(0, 80)
end

def config_parse_tags(tags_string)
  tags = ['meetup', 'video']
  if tags_string && !tags_string.empty?
    tags_string.split(',').each do |tag|
      slug = config_slugify(tag.strip)
      tags << slug unless slug.empty? || tags.include?(slug)
    end
  end
  tags.uniq
end

def config_parse_date(published_at)
  return Date.today.strftime('%Y-%m-%d') unless published_at
  Date.parse(published_at.to_s).strftime('%Y-%m-%d')
rescue
  Date.today.strftime('%Y-%m-%d')
end

# Track slugs to handle duplicates and collect all videos for index
video_slugs = {}
all_videos = []

data.videographer.each do |video_entry|
  base_slug = config_slugify(video_entry[:title] || video_entry['title'])
  next if base_slug.empty?

  # Handle duplicate slugs by appending a counter
  slug = base_slug
  if video_slugs[base_slug]
    video_slugs[base_slug] += 1
    slug = "#{base_slug}-#{video_slugs[base_slug]}"
  else
    video_slugs[base_slug] = 1
  end

  video_data = {
    title: video_entry[:title] || video_entry['title'],
    youtube_id: video_entry[:youtube_id] || video_entry['youtube_id'],
    description: video_entry[:description] || video_entry['description'] || '',
    date: config_parse_date(video_entry[:published_at] || video_entry['published_at']),
    tags: config_parse_tags(video_entry[:tags] || video_entry['tags']),
    thumbnail_url: video_entry[:thumbnail_url] || video_entry['thumbnail_url'],
    slug: slug
  }

  all_videos << video_data
  proxy "/videos/#{slug}/index.html", "/video.html", locals: { video: video_data }, ignore: true
end

# Video index page
proxy "/videos/index.html", "/video_index.html", locals: { videos: all_videos }, ignore: true

# Video tag pages - load JSON directly since data.videographer is lazy
require 'json'
videographer_json = JSON.parse(File.read('data/videographer.json'))

videos_by_tag = {}
video_slugs_for_tags = {}

videographer_json.each do |video_entry|
  title = video_entry[:title] || video_entry['title']
  base_slug = config_slugify(title)
  next if base_slug.empty?

  # Handle duplicate slugs
  slug = base_slug
  if video_slugs_for_tags[base_slug]
    video_slugs_for_tags[base_slug] += 1
    slug = "#{base_slug}-#{video_slugs_for_tags[base_slug]}"
  else
    video_slugs_for_tags[base_slug] = 1
  end

  video_data = {
    title: title,
    date: config_parse_date(video_entry[:published_at] || video_entry['published_at']),
    slug: slug
  }

  tags = config_parse_tags(video_entry[:tags] || video_entry['tags'])
  tags.each do |tag|
    videos_by_tag[tag] ||= []
    videos_by_tag[tag] << video_data
  end
end

videos_by_tag.each do |tag, tag_videos|
  proxy "/videos/tags/#{tag}/index.html", "/video_tag.html", locals: { tag_name: tag, tag_videos: tag_videos }, ignore: true
end

# Ignore the video_tag and video_index templates
ignore 'video_tag.html'
ignore 'video_index.html'

# Note: automatic_image_sizes was removed in Middleman 4

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

#set :markdown, :parse_block_html => true

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

configure :development do
  #activate :livereload
end

# Build-specific configuration
configure :build do
  # Minify CSS for production
  activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

# Deployment is handled via manual git push (see Makefile/GitHub Actions)
