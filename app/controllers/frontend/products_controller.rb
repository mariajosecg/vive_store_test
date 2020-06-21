# frozen_string_literal: true

# module Api
module Frontend
  # class ProductsController
  class ProductsController < BaseController
    def index
      @products = Product.all.page params[:page]
    end

    def show
      @product = Product.find_by_id(params[:id])
    end
  end
end
