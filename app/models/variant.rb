# frozen_string_literal: true

# class Variant
class Variant < ApplicationRecord
  validates_presence_of :name, :price
  validates_numericality_of :price, greather_than: 0
  belongs_to :product
end
