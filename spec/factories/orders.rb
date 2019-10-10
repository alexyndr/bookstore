# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    association(:delivery)
    user { nil }
    number { 1 }
    status { 0 }
  end

  trait :add_coupon do
    after(:create) do |order|
      order.coupon = create(:coupon)
      order.save
    end
  end

  trait :add_delivery do
    after(:create) do |order|
      order.delivery = create(:delivery)
      order.save
    end
  end

  trait :add_addresses do
    after(:create) do |order|
      order.billing_address = create(:address)
      order.shipping_address = create(:address)
      order.save
    end
  end
end
