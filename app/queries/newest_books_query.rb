# frozen_string_literal: true

class NewestBooksQuery
  def initialize
    @books = Book.all
  end

  def self.call
    new.call
  end

  def call
    books.order(created_at: :desc).first(3)
  end

  private

  attr_reader :books
end
