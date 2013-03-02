source 'https://rubygems.org'

gem 'rails', '3.2.11'
gem 'pg'
gem 'jquery-rails'
gem 'simple_form'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "therubyracer"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem 'twitter-bootstrap-rails'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'haml-rails'
  gem 'capybara'
end

group :test do
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

group :development do
  gem 'thin'
end
