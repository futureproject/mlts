source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Puma for production web server
gem 'puma'

# Caching
gem 'dalli'
gem 'actionpack-action_caching'
gem 'connection_pool'
gem 'rails-observers'

# Heroku and New Relic
gem 'rails_12factor', group: :production
gem 'newrelic_rpm'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# gem 'jquery-turbolinks'
#
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Rails Admin
gem 'rails_admin'
gem 'wysiwyg-rails'
gem 'paperclip'
gem 'aws-sdk'
gem 'devise'
gem 'rails_admin_import', '~> 1.2'

# Google Maps
gem 'geocoder'
gem 'gmaps4rails'
gem 'underscore-rails'

# Screening import
gem 'roo', '~> 2.5.0'

# For storing AWS security credentials locally
gem 'dotenv-rails', :groups => [:development, :test]

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'pry-rails'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

ruby "2.2.3"
