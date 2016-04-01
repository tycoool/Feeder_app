source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18.3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Add in the Bootstrap framework
gem 'bootstrap-sass', '~> 3.3.5'
# Adds will paginate with a bootstrap look and feel
gem 'will_paginate-bootstrap', '~>1.0.1'
# Add in simpleform to generate nice looking forms
gem 'simple_form', '~>3.2.0'
# Add complex search forms logic
gem 'ransack', '~>1.7.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Attach css classes to emails
gem 'roadie', '~> 3.0.5'
gem 'roadie-rails', '~> 1.0.6'

# Annotate models
# To annotate all your models
# cd /path/to/app
# annotate --exclude tests,fixtures,factories,serializers
gem 'annotate', '~> 2.6.10', :group => :development

# Webservers
gem 'thin', '~> 1.6.4' # a problem with eventmachine may arise, solution here: https://github.com/eventmachine/eventmachine/issues/602
gem 'puma', '~> 2.14.0'
gem 'rack-timeout', '~> 0.3.2', :group => :production
gem "rack-timeout-puma", '~> 0.0.1', :group => :production # Prevents rack timeouts when using puma webserver

# Solves the font problem for cross origin
gem 'font_assets', '~> 0.1.12'

# Handles delayed jobs
gem 'resque', "~> 1.22.0", :require => "resque/server"
# Scheduler adapter for Resque
# Mind that we must use version 2.2.0, since Heroku uses resque version 1.22.0
gem 'resque-scheduler', "~> 2.2.0", :require => ['resque_scheduler', 'resque_scheduler/server']
# Actiomailer adapter for Resque
gem 'resque_mailer', "~> 2.2.7"
# Scales out your resque based workers by running multiple workers per dyno
gem 'resque-pool', "~> 0.6.0"

# Static asset serving and logging on Heroku
gem 'rails_12factor', group: :production

# Feeds parsing and validation
gem 'feedjira', '~> 2.0.0'
gem 'feedvalidator', '~> 0.2.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # To have rails panel work on Chrome
  gem 'meta_request'
end

# The following line will setup for RVM and Heroku the default ruby Version
ruby '2.2.1'
# The following line will setup for RVM default gemset
#ruby-gemset=feeder
