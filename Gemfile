source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 6.0.0.rc1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'sass-rails', '~> 5.0'
gem 'haml'
gem 'cancancan', '~> 2.0'
gem 'carrierwave', '~> 1.0'
gem 'font-awesome-rails'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'cancan'
  gem 'ffaker'
  gem 'overcommit'
  gem 'haml'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'shoulda-matchers'
  gem 'reek'
  gem 'rspec-rails', '~> 4.0.0.beta2'
  gem "rspec_junit_formatter"
  gem 'rubocop'
  gem 'kaminari'
  gem "factory_bot_rails"
  gem 'rubocop-rspec'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'simplecov'
  gem 'capybara'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
