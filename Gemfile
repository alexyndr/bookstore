# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'dotenv-rails', require: 'dotenv/rails-now'

gem 'cancancan', '~> 2.0'
gem 'carrierwave', '~> 1.0'
gem 'font-awesome-rails'
gem 'haml'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 6.0.0.rc1'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'letter_opener', group: :development

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  gem 'devise'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'nokogiri', '>= 1.10.4'
  gem 'omniauth-facebook'
  gem 'overcommit'
  gem 'pagy'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rails-controller-testing'
  gem 'reek'
  gem 'rspec-rails', '~> 4.0.0.beta2'
  gem 'rspec_junit_formatter'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'shoulda-matchers'
  gem 'simplecov'
  # Rails Internationalization
  gem 'aasm'
  gem 'activeadmin'
  gem 'activeadmin_addons'
  gem 'aws-sdk-s3', require: false
  gem 'country_select', '~> 4.0'
  gem 'draper'
  gem 'image_processing', '~> 1.2'
  gem 'rails-i18n'
  gem 'ransack', '2.3.0'
  gem 'simple_form'
  # gem "mini_magick"
  gem 'active_storage_validations'
  gem 'selenium-webdriver'
  gem 'wicked'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
