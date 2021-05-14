# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category

  validates :description, :price, :category, presence: true

  def full_description
    "#{description} - #{price}"
    # "{product1 - 1.20 }"
  end
end
