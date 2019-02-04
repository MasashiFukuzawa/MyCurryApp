require_relative 'boot'

require 'rails/all'
require 'active_storage/engine'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MyCurryApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.generators.template_engine = :slim
    config.i18n.default_locale = :ja
    config.autoload_paths += %W('#{config.root}/app/validators') 
    config.assets.initialize_on_precompile = false

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
    config.generators do |g|
      g.test_framework :rspec,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
    end

    # 各APIのベースURL
    config.twitter_base_url = 'https://twitter.com'
    config.facebook_base_url = 'https://www.facebook.com'
    config.tabelog_base_url = 'https://tabelog.com'
    config.google_map_base_url = 'https://www.google.com/maps'
  end
end
