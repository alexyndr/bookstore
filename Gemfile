# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'dotenv-rails', require: 'dotenv/rails-now'

gem 'aws-sdk-s3', require: false
gem 'activeadmin'
gem 'activeadmin_addons'
gem 'active_storage_validations'
gem 'aasm'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'cancancan', '~> 2.0'
gem 'country_select', '~> 4.0'
gem 'devise'
gem 'draper'
gem 'ffaker'
gem 'font-awesome-rails'
gem 'omniauth-facebook'
gem 'haml'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rails', '~> 6.0.0.rc1'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'rails-i18n'
gem 'image_processing', '~> 1.12'
gem 'nokogiri', '>= 1.10.4'
gem 'pagy'
gem 'webpacker'
gem 'wicked'
gem "omniauth-rails_csrf_protection"

group :production do
  gem 'sendgrid-ruby'
end

group :development do
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'overcommit'
  gem 'reek'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :test do
  gem 'capybara'
  # gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'shoulda-matchers'
  gem 'rspec-rails', '~> 4.0.0.beta2'
  gem 'rspec_junit_formatter'
  gem 'rails-controller-testing'
end
