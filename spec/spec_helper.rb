require 'capybara/rspec'

require "bundler/setup"
require "block_yundun"

Dir[File.expand_path('../../apps/*.rb', __FILE__)].each {|file| require file}

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: ENV.fetch('SELENIUM_BROWSER', 'firefox').to_sym)
end

TestRailsApp::Application.configure do |app|
  app.middleware.use Rack::BlockYundun
end