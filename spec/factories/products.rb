# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    description { 'MyString' }
    price { '9.99' }
    category { nil }
  end
end
