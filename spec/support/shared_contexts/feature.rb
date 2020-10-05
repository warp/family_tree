require "rack/test"
require "routing"

RSpec.shared_context 'Feature', :feature do
  include Rack::Test::Methods

  let(:app) { Rack::Builder.new.run(Routing.build) }
end

RSpec.configure do |rspec|
  rspec.include_context 'Feature', :feature
end
