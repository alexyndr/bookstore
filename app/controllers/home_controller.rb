# frozen_string_literal: true

# Home controller
class HomeController < ApplicationController
  def index
    @books = Book.all
    @newest = NewestBooksQuery.call
  end
end
