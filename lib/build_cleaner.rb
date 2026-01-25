# Middleman 4 extension to clean build directory before builds
class BuildCleaner < Middleman::Extension
  def initialize(app, options_hash = {}, &block)
    super
  end

  def before_build
    FileUtils.rm_rf(app.config[:build_dir])
  end
end

Middleman::Extensions.register(:build_cleaner, BuildCleaner)
