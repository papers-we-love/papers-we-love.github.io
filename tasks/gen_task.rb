require 'middleman-core/cli'
require 'date'
require 'erb'

require_relative '../lib/safe-parameterize.rb'

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
end
