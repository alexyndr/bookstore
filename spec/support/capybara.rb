require 'capybara/rails'

Capybara.default_driver = :selenium_chrome_headless
# Capybara.ignore_hidden_elements = true

Capybara.server = :puma, { Silent: true }
