# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    # dynamic configuration with faker
    description { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
    category
  end
end
