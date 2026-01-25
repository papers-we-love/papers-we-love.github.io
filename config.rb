require 'lib/event-handler.rb'
require 'lib/build_cleaner'

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
