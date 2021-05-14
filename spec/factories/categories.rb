# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    # dynamic configuration with faker
    description { Faker::Commerce.department }
  end
end
