# frozen_string_literal: true

# module Api
module Api
  # module V1
  module V1
    # class ProductsController
    class ProductsController < BaseApiController
      before_action :validate_data
      
      def create
        HandleProductsPayloadJob.perform_later(products_params)
        render_success
      end

      private

      def products_params
        params[:_json].map do |product|
          product.permit(
            :name,
            :description,
            {
              variants: [:name, :price]
            }
          )
        end
      end

      def validate_data
        render_error('Data not found') unless params[:_json]
      end

    end
  end
end
