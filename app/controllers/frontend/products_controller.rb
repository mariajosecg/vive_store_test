# frozen_string_literal: true

# module Frontend
module Frontend
  # class ProductsController
  class ProductsController < BaseController
    def index
      @products = Product.all.page(params[:page]).per(20)
    end

    def show
      @product = Product.find_by_id(params[:id])
    end
  end
end
