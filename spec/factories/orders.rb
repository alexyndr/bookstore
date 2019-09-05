# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    association(:user)
    number { 1 }
    status { 0 }
    compleated_at { '2019-08-16 11:38:26' }
  end
end
