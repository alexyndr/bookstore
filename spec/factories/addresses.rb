# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    # association(:user)
    first_name { 'Alex' }
    last_name { 'Belik' }
    address { 'Sholom Aleyhen' }
    city { 'Dnipro' }
    zip { 1 }
    country { 'Ukraine' }
    phone_number { '+380933455' }
  end

  trait :billing do
    type { Address.address_type[0] }
  end
end
