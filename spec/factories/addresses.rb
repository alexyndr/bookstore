# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    association(:user)
    first_name { 'MyString' }
    last_name { 'MyString' }
    address { 'MyString' }
    city { 'MyString' }
    zip { 1 }
    country { 'MyString' }
    phone_number { '+380933455' }
  end
end
