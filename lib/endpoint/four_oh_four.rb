module Endpoint
  class FourOhFour
    def self.call(env)
      return ["text/plain", 404, 'not found']
    end
  end
end
