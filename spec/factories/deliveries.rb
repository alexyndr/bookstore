FactoryBot.define do
  factory :delivery do
    name { "MyString" }
    shipping_time { "MyString" }
    price { rand(20..30) }
  end
end
