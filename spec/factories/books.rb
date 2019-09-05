# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    association(:category)
    title            { FFaker::Book.unique.title }
    description      { FFaker::Book.description(5) }
    price            { rand(16.00..31.00).round(2) }
    height           { FFaker::Random.rand(2) }
    width            { FFaker::Random.rand(2) }
    depth            { FFaker::Random.rand(2) }
    materials        { 'plastic' }
    publication_year { 2002 }
  end

  trait :attach_covers do
    after(:build) do |book|
      file_path = Rails.root.join('spec', 'fixtures', 'files', 'test_cover.jpg')
      file = Rack::Test::UploadedFile.new(file_path, 'image/png')
      book.covers.attach(file)
    end
  end
end
