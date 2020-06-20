# frozen_string_literal: true

# ProductCreatorJob
class ProductCreatorJob < ApplicationJob
  queue_as :default

  def perform(product)
    execute do
      @new_product = Product.new(name: product[:name], description: product[:description])

      product[:variants]&.each do |variant|
        @new_product.variants.new(name: variant[:name],
                                  price: variant[:price])
      end
    end
  end

  private

  def execute
    request = Request.create(status: 'failed')
    yield
    request.success! if @new_product.save
  end
end
