source 'https://rubygems.org'
ruby '2.3.0'

# Rails
gem 'rails', '4.2.5'

# ENV - load first
gem 'dotenv-rails', groups: [:development, :test]

# Database
gem 'pg'

# Assets
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'

# Views
gem 'slim-rails'
gem 'simple_form'

# Links
gem 'turbolinks'

# JSON APIs
gem 'jbuilder', '~> 2.0'

group :development do
  gem 'better_errors'
  gem 'spring'
end

group :development, :test do
  gem 'factory_girl_rails', '~> 4.0'
  gem 'pry-byebug'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'simplecov'
  gem 'turnip'
  gem 'vcr'
  gem 'webmock'
end

group :production do
  #because heroku
  gem 'rails_12factor'
end
