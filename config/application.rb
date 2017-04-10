require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AuthProject
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    #config.active_record.observers = :product_observer
    # force HTTPS on all environments
    
    #it loaded the file before object get load
    config.to_prepare do
    Dir[ File.expand_path(Rails.root.join("lib/*.rb")) ].each do |file|
        require_dependency file
    end
   # require_dependency 'product_cache'
    end
    config.force_ssl = true

  end
end
