# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)
require 'spec_helper'
require 'simplecov'
require 'aasm/rspec'
require 'rspec/rails'
require 'capybara/rails'
# require 'capybara/dsl'

abort('The Rails environment is running in production mode!') if Rails.env.production?

SimpleCov.start do
  add_filter '/spec/'
  minimum_coverage 90
  add_filter 'app/admin'
end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

Capybara.default_driver = :selenium_chrome_headless
# Capybara.ignore_hidden_elements = true

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include FactoryBot::Syntax::Methods # FactoryBot

  config.include Devise::Test::ControllerHelpers, type: :controller # Devise

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include Warden::Test::Helpers # DEVIDSE HELPERS CAPYBARA
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
