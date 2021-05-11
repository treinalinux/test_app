# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    sequence(:description) { |n| "Order number - #{n}" }
    customer
  end
end
