# frozen_string_literal: true

require 'ffaker'
require 'open-uri'
# require 'factory_bot'
# require 'spec/factories'

def generate_book
  book = Book.new(
    title: FFaker::Book.unique.title,
    description: FFaker::Book.description(5),
    category_id: rand(1..3),
    price: price,
    publication_year: rand(1890..2000),
    height: 5.7,
    depth: 4.6,
    width: 0.9,
    materials: 'Hardcover, glossy paper'
    )

  book.save!
  file = open("#{FFaker::Book.cover}")
  book.covers.attach(io: file, filename: 'image.jpg', content_type: 'image/jpg')
end

def generate_author
  author = Author.new(
    name: FFaker::Name.name,
    description: FFaker::Book.description(3)
  )
  author.save!
end

def generate_review
  review = Review.new(
    title: FFaker::Book.description.truncate(15),
    text: FFaker::Book.description(2),
    user_id: User.all.sample.id,
    book_id: Book.all.find_by(id: 1).id,
    score: 2,
    status: 0
  )
  review.save!
end

def generate_address
  address = Address.new(
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.first_name,
    user_id: User.all.sample.id,
    order_id: Order.all.sample.id,
    address: FFaker::Address.street_name,
    city: FFaker::Address.city.split.first,
    zip: FFaker::AddressAU.postcode,
    country: FFaker::Address.country_code,
    phone_number: '+380' + FFaker::PhoneNumberDA.phone_number
  )
  address.save!
end

def generate_order
  order = Order.new(
    number: rand(200..2000),
    compleated_at: Time.now,
    user_id: User.all.sample.id
    )
  order.save!
end

def generate_user
  user = User.new(
    email: FFaker::InternetSE.safe_email,
    password: '111111',
    confirmed_at: Time.now,
    name: FFaker::Name.name
  )
  user.save!
end

def generate_delivery
  delivery = Delivery.new(
    name: "Delivery #{FFaker::Book.unique.title}",
    shipping_time: "#{[1,2,3,4,5,6].sample} days",
    price: [22,32,14,25].sample
  )
  delivery.save!
end

def generate_category
  Category.new(id: 1, title: 'Mobile development').save!
  Category.new(id: 2, title: 'Photo').save!
  Category.new(id: 3, title: 'Web design').save!
end

def generate_authors_book
  books = Book.all
  authors = Author.all
  authors_id = authors.map(&:id)
  books.each do |book|
    BookAuthor.create(book_id: book.id, author_id: authors_id[rand(authors_id.length)])
  end
end

def price
  rand(16.0..31.0).round(2)
end

generate_category
8.times {generate_user}
17.times { generate_book }
5.times { generate_author }
4.times { generate_delivery }
generate_authors_book
12.times {generate_order}
4.times {generate_review}

4.times { Coupon.create(code: FFaker::AddressAU.postcode) }

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?