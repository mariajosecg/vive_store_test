# frozen_string_literal: true

# class Request
class Request < ApplicationRecord
	enum status: %i[success failed]
end
