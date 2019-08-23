# frozen_string_literal: true

require 'ffaker'

def generate_book
  book = Book.new(
    title: FFaker::Book.title + FFaker::Name.first_name,
    description: FFaker::Book.description(5),
    category_id: rand(1..3),
    price: price,
    cover: FFaker::Book.cover,
    publication_year: rand(1890..2000),
    height: 5.7,
    depth: 4.6,
    width: 0.9,
    materials: 'Hardcover, glossy paper'
    )
  book.save!
end

def generate_author
  author = Author.new(
    name: FFaker::Name.name,
    description: FFaker::Book.description(3)
  )
  author.save!
end

def generate_addresses
  billing = BillingAddress.new(
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
  shipping = ShippingAddress.new(
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
  billing.save!
  shipping.save!
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
6.times {generate_user}
24.times { generate_book }
5.times { generate_author }
generate_authors_book
12.times {generate_order}
generate_addresses

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?