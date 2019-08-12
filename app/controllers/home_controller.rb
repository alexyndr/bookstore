# frozen_string_literal: true

# Home controller
class HomeController < ApplicationController
  attr_reader :books, :newest
  def index
    @books = Book.all
    @book = books.all.sample
    @newest = BooksFilteringService.new.newest_books
  end
end
