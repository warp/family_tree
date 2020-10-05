$LOAD_PATH << File.expand_path('../lib', __FILE__)

require "routing"

run Routing.build
