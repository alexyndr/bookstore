# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    title { FFaker::Lorem.word }
  end
end
