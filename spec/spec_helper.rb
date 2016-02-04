require 'database_cleaner'
require 'webmock/rspec'
require 'vcr'
require File.expand_path("../../config/environment", __FILE__)

ENV['RAILS_ENV'] ||= 'test'

WebMock.disable_net_connect!(allow_localhost: true)

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.configure_rspec_metadata!
  config.hook_into :webmock
  config.default_cassette_options = {
      match_requests_on: [:uri, :body, :method]
    }
end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
