# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( alert.js
                                                  home.js
                                                  teams.js
                                                  users.js
                                                  teams.css
                                                  home.css
<<<<<<< HEAD
                                                  users.css
                                                  logo_imobilis2.png
                                                  usuario_padrao.png)

Rails.application.config.assets.precompile += %w( usebootstrap.css
                                                  bootstrap.css
                                                  usebootstrap.js )
=======
                                                  usuario_padrao.png
                                                  users.css)
>>>>>>> d0c6183c3349cba16c54d8ce4c0fb5ee26c49700
