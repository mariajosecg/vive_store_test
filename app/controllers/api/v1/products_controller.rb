# frozen_string_literal: true

# module Api
module Api
  # module V1
  module V1
    # class ProductsController
    class ProductsController < BaseApiController
      before_action :validate_data

      def create
        HandleProductsPayloadJob.perform_later(permited_params)

        render_success
      end

      private

      def permited_params
        params[:_json].map do |product|
          product.permit(
            :name,
            :description,
            {
              variants: %i[name price]
            }
          )
        end
      end

      def validate_data
        unless params[:_json].present? || params[:_json].any?
          render_error('Data not found')
        end
      end
    end
  end
end