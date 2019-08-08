# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    description { FFaker::Book.description(5) }
    category
    price { rand(16.00..31.00).round(2) }
  end
end
