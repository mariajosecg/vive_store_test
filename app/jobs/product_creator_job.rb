# frozen_string_literal: true

# ProductCreatorJob
class ProductCreatorJob < ApplicationJob
  queue_as :default

  def perform(product)
    execute do
      @new_product = Product.new(product_params(product))

      product[:variants]&.each do |variant|
        @new_product.variants.new(variants_params(variant))
      end
    end
  end

  private

  def product_params(product)
    { name: product[:name], description: product[:description] }
  end

  def variants_params(variant)
    { name: variant[:name], price: variant[:price] }
  end

  def execute
    request = Request.create(status: 'failed')
    yield
    request.success! if @new_product.save
  end
end
