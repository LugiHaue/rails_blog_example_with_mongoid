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


 #########################
 ##                     ## 
 ##      P A N E L      ##
 ##                     ##
 #########################

 # Bootstrap core CSS
 Rails.application.config.assets.precompile += %w( panel/bootstrap.css )

 # External CSS
 Rails.application.config.assets.precompile += %w( panel/font-awesome/css/font-awesome.css )
 Rails.application.config.assets.precompile += %w( panel/zabuto_calendar.css )
 Rails.application.config.assets.precompile += %w( panel/gritter/jquery.gritter.css )
 Rails.application.config.assets.precompile += %w( panel/lineicons/style.css )
 Rails.application.config.assets.precompile += %w( panel/fancybox/jquery.fancybox.css )

 # Custom styles for this template
 Rails.application.config.assets.precompile += %w( panel/style.css )
 Rails.application.config.assets.precompile += %w( panel/style-responsive.css )


 # Javascript
 Rails.application.config.assets.precompile += %w( panel/jquery.js )
 Rails.application.config.assets.precompile += %w( panel/jquery-1.8.3.min.js )
 Rails.application.config.assets.precompile += %w( panel/bootstrap.min.js )
 Rails.application.config.assets.precompile += %w( panel/jquery.dcjqaccordion.2.7.js )
 Rails.application.config.assets.precompile += %w( panel/jquery.scrollTo.min.js )
 Rails.application.config.assets.precompile += %w( panel/jquery.nicescroll.js )
 Rails.application.config.assets.precompile += %w( panel/jquery.sparkline.js )

 # Common script for all pages
 Rails.application.config.assets.precompile += %w( panel/common-scripts.js )

 Rails.application.config.assets.precompile += %w( panel/gritter/jquery.gritter.js )
 Rails.application.config.assets.precompile += %w( panel/gritter/gritter-conf.js )

 # Script
 Rails.application.config.assets.precompile += %w( panel/sparkline-chart.js )
 Rails.application.config.assets.precompile += %w( panel/zabuto_calendar.js )
 Rails.application.config.assets.precompile += %w( panel/chart-master/Chart.js )
 Rails.application.config.assets.precompile += %w( panel/fancybox/jquery.fancybox.js )

