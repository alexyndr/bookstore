# frozen_string_literal: true

class Category
  def initialize
    @books = Book.all
  end

  def category_sort(category = 'Photo')
    @books.select { |book| book.category.title == category }
  end
end
