FactoryBot.define do
  factory :card do
    # association(:order)
    card_holder { FFaker::Lorem.word }
    number { (16.times.map{Random.rand(9)}).join }
    valid_thru { "10/#{Time.now.year.to_s.last(2)}" }
    cvv { (3.times.map{Random.rand(9)}).join }
    order { nil }
  end
end
