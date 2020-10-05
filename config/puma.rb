require_relative '../lib/config'

workers Config.web_concurrency

threads Config.max_threads, Config.max_threads

rackup       DefaultRackup
port         Config.port
environment  Config.rack_env

# Preload the app before forking workers - this reduces the total memory usage
# of the application by using an operating system feature called copy-on-write.
#
# This also ensures that the server exits immediately if the worker will be
# unable to boot (otherwise the server will just continually try to restart the
# worker when it dies).
#
# See https://github.com/puma/puma/tree/2668597ec1dd9546d83db9f2ec5ad092add483e6#clustered-mode
# for more information.
preload_app!
