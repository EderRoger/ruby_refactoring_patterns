require 'simplecov'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

require_relative '../lib/factory/search'
require_relative '../lib/factory/criteria_factory'
