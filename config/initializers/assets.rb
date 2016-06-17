# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( animate.css )
Rails.application.config.assets.precompile += %w( bootstrap-social.css )
Rails.application.config.assets.precompile += %w( custom.css )
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( social-buttons.css )
Rails.application.config.assets.precompile += %w( font-awesome.css )
Rails.application.config.assets.precompile += %w( style.min.css )
Rails.application.config.assets.precompile += %w( static_page.css )

#Javascript
Rails.application.config.assets.precompile += %w( icheck.min.js )
Rails.application.config.assets.precompile += %w( inspinia.js )
Rails.application.config.assets.precompile += %w( notify.js )