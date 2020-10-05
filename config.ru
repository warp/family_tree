$LOAD_PATH << File.expand_path('../lib', __FILE__)

require "routing"

use Rack::Auth::Basic do |username, password|
  [username, password] == [Config.http_username, Config.http_password]
end

run Routing.build
