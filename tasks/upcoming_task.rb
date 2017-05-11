# coding: utf-8
require 'middleman-core/cli'
require 'date'
require 'erb'
require 'yaml'
require 'json'

require_relative '../lib/event-handler.rb'
require_relative '../lib/safe-parameterize.rb'

##
# Generate Upcoming Meetups post from chapters.yml via upcoming command
##
class Gen < Thor
  check_unknown_options!

  namespace :upcoming

  TEMPLATE = 'lib/templates/upcoming_meetups_template.erb'
  DEFAULT_DATA_FILE = 'data/meetup/chapters.yml'

  CHAPTERS_JSON_FILE = 'data/chapters.json'

  EVENTS = []

  attr_reader :output

  def self.source_root
    ENV['MM_ROOT']
  end

  def self.exit_on_failure?
    true
  end

  desc 'upcoming', 'Create a post of meetups for the next month'
  method_option 'month',
                aliases: '-m',
                desc: 'Integer of the month to target, ex: 3 for March'

  method_option 'data',
                aliases: '-d',
                desc: 'YAML dump of Meetup.com chapter information'

  def upcoming
    next_month = date_next_month(make_month(options))
    make_template_vars(next_month)
    filename = options[:data] || DEFAULT_DATA_FILE
    @events = gather_chapter_json(CHAPTERS_JSON_FILE, next_month)
    render(TEMPLATE)
    save
  end

  protected

  def isThisMonthAndHasVenue(event_date, date, event)
    event_date.month == date.month && \
    event_date.year == date.year && \
    event.key?('venue') && event['venue']['address1']
  end

  def gather_chapter_json(filename, date)
    file = File.read(filename)
    chapter_files = []
    chapters = JSON.parse(file)
    chapters.keys.map { |i| 'data/' + i + '.json' }.each do |cfile|
      chapter = File.read(cfile)
      JSON.parse(chapter).values.each do |e|
        ed = Time.at(e['time'] / 1000)
        if isThisMonthAndHasVenue(ed, date, e)
          if e['venue']['city'] == "Seoul" || e['venue']['city'] == "서울"
            if /papers we love/.match(e['title'].downcase)
              chapter_files = chapter_files.push e
            end
          else
            chapter_files = chapter_files.push e
          end
        end
      end
    end
    chapter_files.sort_by! { |e| e['time'] }
  end

  def make_month(options)
    if options[:month].to_i > 0
      return options[:month].to_i
    else
      return Time.now.month + 1
    end
  end

  # Setup vars needed by erb template
  def make_template_vars(month)
    @month = month.strftime('%B')
    @title = "#{@month} Meetups"
    @slug = safe_parameterize(@title)
    @author = 'Joshua'
    @date = month.strftime('%Y-%m-%d')
  end

  # Generate a UTC time object for the month passed in or
  # for the next month from now
  def date_next_month(month)
    t = Time.now
    m = month || t.month + 1
    Time.utc(t.year, m, 1)
  end

  # We only want events that are in the month specified and current year.
  # We also filter out any events missing a venue.
  def gather_events(filename, date)
    chapters = YAML.load_file(filename)
    events = chapters.collect do |k,v|
      v['events'].select do |e|
        ed = Time.at(e['time'] / 1000)
        ed.month == date.month && ed.year == date.year && e.key?('venue')
      end
    end
    sort_events(events.reject(&:empty?).flatten).reverse
  end

  def render(template)
    b = binding
    ERB.new(File.read(template), 0, '', '@output').result b
  end

  def save
    filepath = File.join('source', "#{@date}-#{@slug}.html.markdown")
    File.write(filepath, @output)
  end
end
