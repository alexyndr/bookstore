# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    first_name { 'MyString' }
    last_name { 'MyString' }
    address { 'MyString' }
    city { 'MyString' }
    zip { 1 }
    country { 'MyString' }
    phone_number { 'MyString' }
  end
end
