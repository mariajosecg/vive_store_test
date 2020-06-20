# frozen_string_literal: true
require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV["REDISTOGO_URL"], size: 30 }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV["REDISTOGO_URL"], size: 30 }
end
