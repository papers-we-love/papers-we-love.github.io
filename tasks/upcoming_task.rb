require 'middleman-core/cli'
require 'active_support/inflector'
require 'active_support/inflector/transliterate'
require 'date'
require 'erb'
require 'yaml'

require_relative '../lib/event-handler.rb'

class Gen < Thor
  check_unknown_options!

  namespace :upcoming

  TEMPLATE = 'lib/templates/upcoming_meetups_template.erb'
  DEFAULT_DATA_FILE = 'data/meetup/chapters.yml'

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

  def upcoming()
    month = options[:month] || Time.now.month + 1
    next_month = get_next_month()
    filename = options[:data] || DEFAULT_DATA_FILE

    @month = next_month.strftime('%B')
    @title = "#{@month} Meetups"
    @slug = safe_parameterize(@title)
    @author = 'Joshua'
    @date = next_month.strftime('%Y-%m-%d')

    @events = gather_events(filename, month)

    render(TEMPLATE)
    save
  end

  protected

  def get_next_month
    t = Time.now
    Time.utc(t.year, t.month + 1, 1)
  end

  # We only want events that are upcoming and in the month specified.
  # We also filter out any events missing a venue.
  def gather_events(filename, month)
    chapters = YAML.load_file(filename)
    events = chapters.collect do |k,v|
      v['events'].select do |e|
        em  = Time.at(e['time'] / 1000).month
        e['status'] == "upcoming" && em == month && e.has_key?('venue')
      end
    end
    sort_events(events.reject { |i| i.empty? }.flatten).reverse
  end

  def render(template)
    b = binding
    ERB.new(File.read(template), 0, '', "@output").result b
  end

  def save
    filepath = File.join('source', "#{@date}-#{@slug}.html.markdown")
    File.write(filepath, @output)
  end

  # Parameterize a string preserving any multibyte characters
  def safe_parameterize(str)
    sep = '-'

    # Reimplementation of http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html#method-i-parameterize that preserves un-transliterate-able multibyte chars.
    parameterized_string = ActiveSupport::Inflector.transliterate(str.to_s).downcase
    parameterized_string.gsub!(/[^a-z0-9\-_\?]+/, sep)

    parameterized_string.chars.to_a.each_with_index do |char, i|
      if char == '?' && str[i].bytes.count != 1
        parameterized_string[i] = str[i]
      end
    end

    re_sep = Regexp.escape(sep)
    # No more than one of the separator in a row.
    parameterized_string.gsub!(/#{re_sep}{2,}/, sep)
    # Remove leading/trailing separator.
    parameterized_string.gsub!(/^#{re_sep}|#{re_sep}$/, '')

    parameterized_string
  end
end
