if Rails.env.production?
  uri = URI.parse(ENV["REDISCLOUD_URL"])
  REDIS = Redis.new(:url => uri)
  # Added this line from:
  # http://stackoverflow.com/questions/7737191/how-to-get-redis-to-start-on-heroku
  Resque.redis = REDIS
end
