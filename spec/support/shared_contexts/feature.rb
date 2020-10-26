# frozen_string_literal: true

require 'config'
require 'rack/test'
require 'routing'

RSpec.shared_context 'Feature', :feature do
  include Rack::Test::Methods

  let(:app) { Rack::Builder.parse_file('config.ru').first }
end

RSpec.configure do |rspec|
  rspec.include_context 'Feature', :feature
end
