# frozen_string_literal: true

require 'rack/request'
require 'rack/response'

module Endpoint
  class FourOhFour
    def self.call(env)
      request = Rack::Request.new(env)
      response = Rack::Response.new
      response.headers['Content-Type'] = 'text/plain'
      response.status = 404
      response.body = ['Not Found']
      response.finish
    end
  end
end
