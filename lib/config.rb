require "dotenv"

class Config
  class << self
    # Define a simple ENV var config attribute.  For example, if you call:
    #
    #     Config.env_string("FOO_BAR")
    #
    # A new method `Config.foo_bar` will become available containing
    # the value of the ENV variable name FOO_BAR.
    #
    # If a default is supplied it will be used if no ENV variable is present.
    #
    # If a default is not supplied, the ENV variable must be present.
    def env_string(name, default: nil)
      value = value_from_env_var(name, default)
      create_config_method_from_env_var(name, value)
    end

    # As env_string but the value is cast to a boolean
    def env_boolean(name, default: nil)
      value = value_from_env_var(name, default)
      create_config_method_from_env_var(name, value.to_s.match?(/true/i))
    end

    # As env_string but the value is cast to an integer
    def env_integer(name, default: nil)
      value = value_from_env_var(name, default)
      create_config_method_from_env_var(name, Integer(value))
    end

    private
    def value_from_env_var(name, default)
      if default.nil?
        ENV.fetch(name)
      else
        ENV.fetch(name, default)
      end
    end

    def create_config_method_from_env_var(name, value)
      method_name = name.downcase.to_sym
      self.class.attr_accessor method_name
      send("#{method_name}=", value)
    end
  end

  if ENV["RACK_ENV"] == "test"
    Dotenv.load('.env.test')
  else
    Dotenv.load
  end

  env_string("HTTP_USERNAME", default: '')
  env_string("HTTP_PASSWORD", default: '')

  env_integer('WEB_CONCURRENCY', default: 2)
  env_integer('MAX_THREADS', default: 5)
  env_integer('PORT', default: 3005)
  env_string('RACK_ENV', default: 'development')
end
