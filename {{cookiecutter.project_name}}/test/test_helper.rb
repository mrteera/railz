ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'simplecov'
SimpleCov.start do
  add_filter 'app/channels/application_cable/channel.rb'
  add_filter 'app/channels/application_cable/connection.rb'
  add_filter 'app/mailers/application_mailer.rb'
  add_filter 'app/jobs/application_job.rb'
  add_filter 'app/models/application_record.rb'
  add_filter 'app/controllers/application_controller.rb'
end
if ENV['COVERALLS'] != 'false'
  require 'coveralls'
  SimpleCov.formatter = Coveralls::SimpleCov::Formatter
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
end
