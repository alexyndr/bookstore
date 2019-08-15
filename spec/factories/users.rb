# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "person_#{n}@example.com"
    end
    name { 'Alex Belik' }
    password { 'test111XXX' }
    confirmed_at { Time.now }
  end
end
