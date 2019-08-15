# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    description { FFaker::Book.description(5) }
    price { rand(16.00..31.00).round(2) }
    height { 1.1 }
    width { 2.0 }
    depth { 0.8 }
    category
  end
end
