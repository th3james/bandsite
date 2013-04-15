source 'http://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'rake'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier', '1.0.3'
  gem 'execjs'
end

gem 'jquery-rails'
gem 'kaminari'
gem 'pjax_rails'
gem "paperclip", "~> 3.0"
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS

gem "devise"
gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano

group :assets do
  gem 'twitter-bootstrap-rails'
end

group :development do
  gem 'capistrano'
  gem 'rvm-capistrano'
end

group :development, :test do
  gem 'debugger'
  gem 'heroku'
  gem 'taps'
end

group :test do
  # Pretty printed test output
  #gem 'turn', :require => false #Seems to break guard

  gem "factory_girl_rails"
  gem "capybara", '1.1.2'
  gem "guard-test"

  gem 'ruby-prof'
end


