# frozen_string_literal: true

# HandleProductsPayloadJob
class HandleProductsPayloadJob < ApplicationJob
  queue_as :default

  def perform(products)
    products.each do |product|
      ProductCreatorJob.perform_async(product)
    end
  end
end