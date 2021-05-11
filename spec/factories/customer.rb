# frozen_string_literal: true

FactoryBot.define do
  factory :customer, aliases: [:user] do
    transient do
      upcased { false }
    end

    # always use blocks { ... }, the use normally for dynamics, because always use
    name { Faker::Name.name }
    # email { Faker::Internet.email }

    # Working sequence
    # A sequence starting for number 10
    # sequence (:email, 10) { |n| "my_email-#{n}@jobs.corp" }
    # A sequence with method next (a, call next for b, c ...)
    # sequence (:email, 'a') { |n| "my_email-#{n}@jobs.corp" }
    sequence (:email) { |n| "my_email-#{n}@jobs.corp" }

    # gender { %w[M F].sample }
    # Help trait
    trait :female do
      gender { 'F' }
    end

    trait :male do
      gender { 'M' }
    end

    trait :vip do
      vip { true }
      days_to_pay { 30 }
    end

    trait :default do
      vip { false }
      days_to_pay { 15 }
    end

    factory :customer_female, traits: [:female]
    factory :customer_male, traits: [:male]
    factory :customer_vip, traits: [:vip]
    factory :customer_default, traits: [:default]
    factory :customer_female_vip, traits: %i[female vip]
    factory :customer_male_vip, traits: %i[male vip]
    factory :customer_female_default, traits: %i[female default]
    factory :customer_male_default, traits: %i[female default]

    after(:create) do |customer, evaluator|
      # run only after all salve
      customer.name.upcase! if evaluator.upcased
    end
  end
end
