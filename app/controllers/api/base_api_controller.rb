# frozen_string_literal: true

# module Api
module Api
  # class ProductsController
  class BaseApiController < ApplicationController
    include ErrorHandler
    protect_from_forgery unless: -> { request.format.json? }
  end
end