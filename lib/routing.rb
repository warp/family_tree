require "endpoint/four_oh_four"

module Routing
  def build
    Rack::Builder.app(Endpoint::FourOhFour)
  end

  module_function :build
end
