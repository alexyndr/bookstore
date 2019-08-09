# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :categories,      only: %i[index]
  before_action :curent_category, only: %i[index]
  before_action :sort_type, only: %i[index]

  BOOKS = 12

  def show
    @book = Book.find(params[:id])
  end

  def index
    # console
    @pagy, @books = pagy(BookSorterService.new(Book.all, params).call, items: BOOKS, link_extra: 'data-remote="true"')
  end

  private

  def sort_type
    @soring_type = params[:soring_type] ||= 'Newest first'
  end

  def categories
    @categories = Category.all
  end

  def curent_category
    @current_category = Category.find_by(id: params[:category_id]) || Category.new(id: nil, title: 'All')
  end
end
