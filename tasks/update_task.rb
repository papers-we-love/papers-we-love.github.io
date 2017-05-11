require 'middleman-core/cli'
require 'date'
require 'erb'
require 'yaml'

###
# Use Calligraphus to gather Meetup.com data
###
class Update < Thor
  check_unknown_options!

  namespace :update

  OUTPUT_FILE = 'data/meetup/chapters.yml'
  INPUT_FILE = 'source/chapters.yml'

  attr_reader :output

  def self.source_root
    ENV['MM_ROOT']
  end

  def self.exit_on_failure?
    true
  end

  desc 'update', 'Use Calligraphus to update the data files for PWL'
  method_option 'jar',
                aliases: '-j',
                desc: 'Location of Calligraphus JAR file'

  def update
    call_cuttlefish()
    print "=====\n"
  end

  protected

  # Find the JAR in options or in ENV
  def which_jar(options)
    env_jar = ENV['CALLIGRAPHUS_LOCATION']
    opt_jar = options[:jar]
    return opt_jar if opt_jar && File.exist?(opt_jar)
    return env_jar if env_jar && File.exist?(env_jar)
  end

  def call_calligraphus(jar_path)
    print "=====\n"
    fin = File.realpath(INPUT_FILE)
    fout = File.realpath(OUTPUT_FILE)
    fjar = File.realpath(jar_path)
    status = system("java -jar #{fjar} -i #{fin} -o #{fout}")
    if status
      print "Calligraphus transcription complete!\n"
    else
      fail "Calligraphus could not transcribe the data! #{$?} \n"
    end
  end

  def call_cuttlefish
    print "=====\n"
    print "Release Cuttlefish!"
    cuttlefish_path = ENV['CUTTLEFISH_PATH']
    status = system("racket #{cuttlefish_path}/main.rkt #{cuttlefish_path}/.cuttlefishrc")
    if status
      print "Cuttlefish transcription complete!\n"
    else
      fail "Cuttlefish could not transcribe the data #{$?}\n"
    end
  end

end
