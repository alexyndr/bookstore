# frozen_string_literal: true

FactoryBot.define do
  factory :order_item do
    association(:book, price: 150)
    quantity { 1 }
  end
end
