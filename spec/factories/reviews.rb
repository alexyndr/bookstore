# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    title { 'MyString' }
    text { 'MyText' }
    score { 1 }
  end
end
