require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RecordFactory
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.time_zone = 'Tokyo' #標準時を東京に
    config.active_record.default_timezone = :local
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :ja #i18nで日本語化
    config.web_console.whitelisted_ips = '10.0.2.2' #refileが動かないので
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  config.time_zone = 'Tokyo'
  config.generators do |g|
    g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        controller_specs: true,
        routing_specs: false,
        request_specs: false
        g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end

end
