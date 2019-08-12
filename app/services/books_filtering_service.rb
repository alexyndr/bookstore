# frozen_string_literal: true

class BooksFilteringService
  attr_reader :params

  def initialize
    @books = Book
  end

  def newest_books
    @books = @books.order(created_at: :desc).first(3)
  end
end
