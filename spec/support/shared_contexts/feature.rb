require 'rack/test'
require 'routing'

RSpec.shared_context 'Feature', :feature do
  include Rack::Test::Methods

  let(:app) { rack_builder.run(Routing.build) }
  let(:rack_builder) { Rack::Builder.new }
end

RSpec.configure do |rspec|
  rspec.include_context 'Feature', :feature
end
