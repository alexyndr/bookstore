# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    number { 1 }
    status { 'MyString' }
    compleated_at { '2019-08-16 11:38:26' }
  end
end
