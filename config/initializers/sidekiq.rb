# frozen_string_literal: true
require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { url: Figaro.env.redistogo_url, size: 20 }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Figaro.env.redistogo_url, size: 2 }
end
