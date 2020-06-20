# frozen_string_literal: true

Sidekiq.configure_server do |config|
  config.redis = { url: "#{ENV["REDIS_URL"]}:#{ENV["REDIS_PORT"]}" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "#{ENV["REDIS_URL"]}:#{ENV["REDIS_PORT"]}" }
end