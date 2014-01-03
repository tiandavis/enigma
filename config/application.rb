require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Enigma
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    
    #config.generators.assets = false
    #config.generators.helper = false
    #config.generators.view_specs = false
    #config.generators.helper_specs = false
    #config.generators.test_framework = nil
    
    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: true,
        request_specs: false
      g.fixture_replacement :factory_girl, dir: "spec/factories"
    end
    
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    config.assets.paths << "#{Rails.root}/app/assets/javascripts/models"
    config.assets.paths << "#{Rails.root}/app/assets/javascripts/views"
    config.assets.paths << "#{Rails.root}/app/assets/javascripts/collections"
    config.assets.paths << "#{Rails.root}/app/assets/javascripts/vendors"
    config.assets.paths << "#{Rails.root}/app/assets/javascripts/libraries"
    config.assets.paths << "#{Rails.root}/app/assets/javascripts/templates"
  end
end
