# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

 Rails.application.config.assets.precompile += %w( style.css )
 Rails.application.config.assets.precompile += %w( main.css )
 Rails.application.config.assets.precompile += %w( media-queries.css )
 Rails.application.config.assets.precompile += %w( custom.js )


 #################################
 ##                     		## 
 ##      D A S H B O A R D      ##
 ##                     		##
 #################################

 # Bootstrap core CSS
 Rails.application.config.assets.precompile += %w( dashboard/bootstrap.css )

 # External CSS
 Rails.application.config.assets.precompile += %w( dashboard/font-awesome/css/font-awesome.css )
 Rails.application.config.assets.precompile += %w( dashboard/lineicons/style.css )

 # Custom styles for this template
 Rails.application.config.assets.precompile += %w( dashboard/style.css )
 Rails.application.config.assets.precompile += %w( dashboard/style-responsive.css )


 # Javascript
 Rails.application.config.assets.precompile += %w( dashboard/jquery.js )
 Rails.application.config.assets.precompile += %w( dashboard/bootstrap.min.js )
 Rails.application.config.assets.precompile += %w( dashboard/jquery.dcjqaccordion.2.7.js )
