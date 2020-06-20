redis_url = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(url: redis_url)