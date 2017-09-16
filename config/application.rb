require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bope
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
<<<<<<< HEAD
    config.assets.paths << Rails.root.join("vendor", "assets", "images")
    config.i18n.default_locale = :"pt-BR"
    config.time_zone = 'Brasilia'
=======
    config.i18n.default_locale = :"pt-BR"
    # config.time_zone = 'Brasilia'
>>>>>>> d0c6183c3349cba16c54d8ce4c0fb5ee26c49700
  end
end
