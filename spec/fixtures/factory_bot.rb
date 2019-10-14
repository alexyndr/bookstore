# frozen_string_literal: true

FactoryBot.define do
  sequence :number do |n|
    n
  end

  sequence :string do |n|
    "string#{n}"
  end

  sequence :email do |n|
    "email_#{n}@example.com"
  end
end
