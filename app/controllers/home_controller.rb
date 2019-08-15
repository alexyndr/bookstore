# frozen_string_literal: true

# Home controller
class HomeController < ApplicationController
  attr_reader :books, :newest
  def index
    @books = Book.all
    @newest = NewestBooksQuery.call
  end
end
