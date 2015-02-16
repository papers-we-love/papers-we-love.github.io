require 'middleman-core/cli'
require 'yaml'
require 'erb'

# Provides a "chapter" command for adding chapters to data
class Chapter < Thor
  check_unknown_options!

  namespace :chapter

  CHAPTERS = File.join('source', 'chapters.yml')

  attr_reader :output

  def self.source_root
    ENV['MM_ROOT']
  end

  def self.exit_on_failure?
    true
  end

  desc 'chapter NAME', 'Create a chapter listing in chapters.yml'
  method_option 'title',
                aliases: '-t',
                desc: 'The title of the chapter'

  method_option 'description',
                aliases: '-d',
                desc: 'The description of the chapter (for meta tags)'

  method_option 'url',
                aliases: '-u',
                desc: 'The URL for the chapter'

  method_option 'meetup',
                aliases: '-m',
                desc: 'Meetup.com URL'

  def chapter(name)
    fail "No name provided!" if name.nil?

    @name       = name
    @title      = options[:title] || name.capitalize
    @desc       = options[:description] || "The #{@title} chapter of Papers We Love"
    @url        = options[:url] || "http://paperswelove.org"
    @meetup_url = options[:meetup] || nil

    # No meetup url but url is a meetup.com address
    if @meetup_url.nil? && @url =~ /meetup.com/
      @meetup_url = @url.split('/').last
    end

    if @meetup_url =~ /meetup.com/
      @meetup_url = @meetup_url.split('/').last
    end

    if chapter?.nil?
      add_chapter
      create_layout
    else
      fail "#{@name} already exists in #{CHAPTERS}!"
    end
  end

  protected

  def chapter?
    @chapters = YAML.load_file(CHAPTERS)
    @chapters.detect { |chapter| chapter.has_value?(@name) }
  end

  # Adds chapter to YAML
  def add_chapter
    @chapters << { 'name'        => @name,
                   'title'       => @title,
                   'description' => @desc,
                   'url'         => @url,
                   'meetup_url'  => @meetup_url }

    File.open(CHAPTERS, 'w+') { |f| f.write(@chapters.to_yaml) }
  end

  # Generate a generic chapter layout in partials
  def create_layout
    b = binding
    layout = File.join('lib', 'templates', 'chapter_template.erb')
    filename = File.join('source', 'partials', 'chapters', "_#{@name}.erb.markdown")
    ERB.new(File.read(layout), 0, '', '@output').result b
    File.open(filename, 'w+') { |f| f.write(@output) }
  end

end
