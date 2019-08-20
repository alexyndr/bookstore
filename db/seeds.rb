# frozen_string_literal: true

require 'ffaker'

def generate_book
  book = Book.new(
    title: FFaker::Book.title,
    description: FFaker::Book.description(5),
    category_id: rand(1..3),
    price: price,
    cover: FFaker::Book.cover,
    publication_year: rand(1890..2000),
    height: 5.7,
    materials: 'Hardcover, glossy paper',
    depth: 4.6,
    width: 0.9
    )
  book.save!
end

def generate_author
  author = Author.new(name: FFaker::Name.name)
  author.save!
end

def generate_addresses
  billing = BillingAddress.new(
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.first_name,
    user_id: User.last.id,
    order_id: Order.last.id
  )
  shipping = ShippingAddress.new(
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.first_name,
    user_id: User.last.id,
    order_id: Order.last.id
  )
  billing.save!
  shipping.save!
end

def generate_order
  order = Order.new(
    number: rand(1890..2000),
    status: ["done", "not done"].sample,
    compleated_at: Time.now,
    user_id: User.first.id
    )
  order.save!
end

def generate_user
  user = User.new(
    email: "alex@gmai.com",
    password: '11111111',
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
24.times { generate_book }
# sleep 3
# Book.new(title: "Spider MAN!!!", description: FFaker::Book.description(5), category_id: rand(1..3), price: price).save!
# sleep 3
# Book.new(title: "War and Peace", description: FFaker::Book.description(5), category_id: rand(1..3), price: price).save!
4.times { generate_author }
generate_authors_book
generate_user
generate_order
generate_addresses
