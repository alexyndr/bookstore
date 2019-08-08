# frozen_string_literal: true

require 'ffaker'

def generate_book
  book = Book.new(title: FFaker::Book.title, description: FFaker::Book.description(5), category_id: rand(1..3), price: price)
  book.save!
end

def generate_author
  author = Author.new(name: FFaker::Name.name)
  author.save!
end

def generate_category
  Category.new(id: 1, title: 'Mobile development').save!
  Category.new(id: 2, title: 'Photo').save!
  Category.new(id: 3, title: 'Web disign').save!
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
10.times { generate_book }
sleep 3
Book.new(title: "Spider MAN!!!", description: FFaker::Book.description(5), category_id: rand(1..3), price: price).save!
sleep 3
Book.new(title: "War and Peace", description: FFaker::Book.description(5), category_id: rand(1..3), price: price).save!
4.times { generate_author }
generate_authors_book
