# frozen_string_literal: true

FactoryBot.define do
  factory :coupon do
    code { 'MyString' }
    active { false }
    discount { 10 }
  end
end
