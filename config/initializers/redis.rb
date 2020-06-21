# frozen_string_literal: true

redis_url = URI.parse(Figaro.env.redistogo_url)
Redis.new(url: redis_url)
