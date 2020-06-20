redis_url = URI.parse(Figaro.env.redistogo_url)
REDIS = Redis.new(url: redis_url)