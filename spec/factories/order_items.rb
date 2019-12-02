# frozen_string_literal: true

FactoryBot.define do
  factory :order_item do
    association(:book)
    quantity { 1 }
  end
end
