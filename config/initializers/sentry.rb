Sentry.init do |config|
  config.enabled_environments = %|production staging|
  config.dsn = ENV['SENTRY_DSN']
  # config.dsn = ENV.fetch('OSEM_SENTRY_DSN', Rails.application.secrets.sentry_dsn)
  config.breadcrumbs_logger = [:active_support_logger]

  config.backtrace_cleanup_callback = lambda do |backtrace|
    Rails.backtrace_cleaner.clean(backtrace)
  end

  # To activate performance monitoring, set one of these options.
  # We recommend adjusting the value in production:
  config.traces_sample_rate = 0.5
  # or
  # config.traces_sampler = lambda do |context|
  #  true
  # end

  # During deployment we touch tmp/restart.txt, let's use its last access time as release.
  # Unless someone has set a variable of course...
  # osem_version_from_file = nil
  # version_file = File.expand_path('../../tmp/restart.txt', __dir__)
  # osem_version_from_file = File.new(version_file).atime.to_i if File.file?(version_file)
  # osem_version = ENV.fetch('OSEM_SENTRY_RELEASE', osem_version_from_file)
  osem_version = ENV['HEROKU_RELEASE_VERSION']
  config.release = osem_version if osem_version
end
