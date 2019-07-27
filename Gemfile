source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.5'
gem 'rails', '~> 5.2.3'
gem 'devise'
gem 'omniauth-twitter'
gem 'cancancan'
gem 'rails_admin'
gem 'faker'
gem 'kaminari'
gem 'bootstrap4-kaminari-views'
gem "bootstrap", ">= 4.3.1"
gem 'jquery-rails', '~> 4.3'
gem 'font-awesome-rails'
gem "shrine"
gem "aws-sdk-s3"
gem 'image_processing'
gem 'mini_magick'
gem 'slim-rails'
gem 'rails-i18n'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'mysql2', '~> 0.5.2'

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_bot_rails', '~> 4.11'
  gem 'rspec-rails'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem "letter_opener"
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers', '~> 3.0'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'rspec_junit_formatter'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
