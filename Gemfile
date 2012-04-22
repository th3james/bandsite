source 'http://rubygems.org'

gem 'rails'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '3.2.3'
  gem 'coffee-rails', '3.2.1'
  gem 'uglifier', '1.0.3'
  gem 'execjs'
end

gem 'jquery-rails'
gem 'kaminari'
gem 'pjax-rails'
gem "paperclip", "~> 3.0"

gem "devise"
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :development, :test do
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'heroku'
  gem 'taps'
end

group :test do
  # Pretty printed test output
  #gem 'turn', :require => false #Seems to break guard

  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-test"

  gem 'ruby-prof'
end


