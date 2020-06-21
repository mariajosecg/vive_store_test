# frozen_string_literal: true

# class Variant
class Variant < ApplicationRecord
  validates_presence_of :name, :price
  validate :price, :greather_than_zero
  belongs_to :product

  private

  def greather_than_zero
		if self.price.to_i <= 0
			errors.add(:price, "Must be greather than 0")
		end
  end
end
