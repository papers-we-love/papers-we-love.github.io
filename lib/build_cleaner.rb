class BuildCleaner < Middleman::Extension

  def initialize(app, options_hash={}, &block)
    super
    FileUtils.rm_rf app.config[:build_dir]
  end

end

::Middleman::Extensions.register(:build_cleaner, BuildCleaner)
