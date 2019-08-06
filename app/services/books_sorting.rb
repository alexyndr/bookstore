# frozen_string_literal: true

class SortBooks
  def initialize(books = Book.all)
    @books = books
  end

  def sort(sort = :create_at)
    @books = @books.order(sort)
  end
end
