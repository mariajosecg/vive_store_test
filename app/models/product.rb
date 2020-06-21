# frozen_string_literal: true

# class Product
class Product < ApplicationRecord
	paginates_per 20
  before_validation :sanitize_variants, if: -> { variants.any? }
  validates_presence_of :name, :description, :variants
  has_many :variants, dependent: :destroy

  default_scope { includes(:variants) }

  private

  def sanitize_variants
    self.variants = self.variants.select(&:valid?)
  end
end
