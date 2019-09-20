FactoryBot.define do
  factory :card do
    number { "MyString" }
    card_holder { "MyString" }
    valid_thru { "MyString" }
    cvv { "MyString" }
    user { nil }
  end
end
