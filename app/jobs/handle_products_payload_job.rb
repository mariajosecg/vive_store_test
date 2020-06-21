# frozen_string_literal: true

# HandleProductsPayloadJob
class HandleProductsPayloadJob < ApplicationJob
  queue_as :default

  def perform(products)
    products.each do |product|
      next if product.blank?
    
      ProductCreatorJob.perform_later(product)
    end
  end
end
