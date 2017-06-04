require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GraphqlIntro
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end

    config.autoload_paths << Rails.root.join('app', 'graph')
    config.autoload_paths << Rails.root.join('app', 'graph', 'types') 
    config.generators do |g|
      g.assets false
      g.helper false
      g.test_framework false
      g.stylesheets false
      g.coffee false
    end


  end
end
