if Rails.env.production?
  # Puma Timeout Config
  Rack::Timeout.timeout = Integer(ENV['RACK_TIMEOUT'] || 20)  # set the value to something lower than 30 (20 will be ok)
end
