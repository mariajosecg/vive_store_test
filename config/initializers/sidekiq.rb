# frozen_string_literal: true

# Sidekiq.configure_server do |config|
#   config.redis = { url: ENV["REDISTOGO_URL"] }
# end

# Sidekiq.configure_client do |config|
#   config.redis = { url: ENV["REDISTOGO_URL"] }
# end

Sidekiq.configure_client do |config|
	config.redis = { :size => 10 }
end

Sidekiq.configure_server do |config|
	config.redis = { :size => 4 }
end