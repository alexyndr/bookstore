# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :categories,      only: %i[index]
  before_action :curent_category, only: %i[index]

  def show
    @book = Book.find(params[:id])
  end

  def index
    console
    @books = BookSorterService.new(Book.all, params).call
  end

  private

  def categories
    @categories = Category.all
  end

  def curent_category
    @current_category = Category.find_by(id: params[:category_id]) || Category.new(id: nil, title: 'All')
  end
end
