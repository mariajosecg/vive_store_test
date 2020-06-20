# frozen_string_literal: true

# module Api
module Api
  # class ProductsController
  class BaseApiController < ApplicationController
    include ErrorHandler
    protect_from_forgery unless: -> { request.format.json? }

    def process_action(*args)
      super
    rescue ActionDispatch::Http::Parameters::ParseError => exception
      render_error('Invalid JSON format')
    end
  end
end