# frozen_string_literal: true

# Home controller
class HomeController < ApplicationController
  attr_reader :books
  def index
    @books = Book.all
    @book = books.all.sample
  end
end

