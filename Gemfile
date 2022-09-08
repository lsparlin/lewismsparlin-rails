source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.4'

gem 'rails', '~> 7.0.0'
gem 'sprockets-rails'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'turbo-rails'
gem 'jsbundling-rails'
gem 'pg'
gem 'prismic.io'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end


gem "stimulus-rails", "~> 1.1"

gem "sanity-ruby", "~> 0.2.0"
