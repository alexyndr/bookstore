# frozen_string_literal: true

class BooksController < ApplicationController
  authorize_resource

  BOOKS_PER_PAGE = 12

  def index
    @soring_type = params[:soring_type] ||= 'Newest first'
    @categories = Category.all
    @current_category = Category.find_by(id: params[:category_id]) || Category.new(id: nil, title: 'All')

    @pagy, @books = pagy(SorterBooksQuery.new(Book.all, params).call,
                         items: BOOKS_PER_PAGE, link_extra: 'data-remote="true"')
  end

  def show
    @book = Book.find(params[:id])
    @order_item = current_order.order_items.build
    @reviews = @book.reviews
  end
end
