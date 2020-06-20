# frozen_string_literal: true

# class Variant
class Variant < ApplicationRecord
  validates_presence_of :name, :price
  belongs_to :product
end
