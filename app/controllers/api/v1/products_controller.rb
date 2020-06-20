# frozen_string_literal: true

# module Api
module Api
  # module V1
  module V1
    # class ProductsController
    class ProductsController < ApplicationController
      protect_from_forgery unless: -> { request.format.json? }
      before_action :set_data

      def create
        @saved = 0

        @products.each do |product|
          execute do
            @new_product = Product.new(name: product[:name],
                                       description: product[:description])

            product[:variants]&.each do |variant|
              @new_product.variants.new(name: variant[:name],
                                        price: variant[:price])
            end
          end
        end

        render_success
      end

      private

      def set_data
        @products = params[:products]

        render_error('Data not found') unless @products
      end

      def render_success
        render json: { success: true,
                       total_requests: @products.count,
                       saved: @saved },
               status: 200
      end

      def render_error(errors)
        render json: { success: false,
                       errors: errors },
               status: 422
      end

      def execute
        yield
        request = Request.create(success: @new_product.save)
        @saved += 1 if request.success
      end
    end
  end
end
