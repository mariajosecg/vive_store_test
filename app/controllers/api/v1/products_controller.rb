# frozen_string_literal: true

# module Api
module Api
  # module V1
  module V1
    # class ProductsController
    class ProductsController < BaseApiController
      before_action :validate_data

      def create
        HandleProductsPayloadJob.perform_later(permit_params)
     
        render_success
      end

      private

      def permit_params
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
        begin
          render_error('Data not found') unless params[:_json].any?
        rescue ActionDispatch::Http::Parameters::ParseError
          render_error('Incorrect JSON format')
        end 
      end
    end
  end
end
