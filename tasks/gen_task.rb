require 'middleman-core/cli'
require 'active_support/inflector'
require 'active_support/inflector/transliterate'
require 'date'
require 'erb'

# Provides a "gen" command which creates scaffolded posts from templates
class Gen < Thor
  check_unknown_options!

  namespace :gen

  TEMPLATES = { :meetups => 'lib/templates/meetups_template.erb' }

  attr_reader :output

  def self.source_root
    ENV['MM_ROOT']
  end

  def self.exit_on_failure?
    true
  end

  desc 'gen TYPE', 'Create a meet-up schedule post'
  method_option 'title',
                aliases: '-t',
                desc: 'The title of the scaffolded post'

  method_option 'date',
                aliases: '-d',
                desc: 'The date of the scaffolded post'

  method_option 'author',
                aliases: '-a',
                desc: 'The author of the scaffolded post'

  def gen(type)
    template = TEMPLATES[type.to_sym]
    fail "No template for #{type}" if template.nil?

    @type   = type
    @title  = options[:title] || 'Meetups this month'
    @slug   = safe_parameterize(@title)
    @author = options[:author] || 'Boatswain Miller'
    @date   = options[:date] ? Time.parse(options[:date]).to_date.strftime('%Y-%m-%d') : Time.now.to_date.strftime('%Y-%m-%d')

    render template
    save
  end

  protected

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
