# frozen_string_literal: true

class SorterBooksQuery
  def initialize(books, params)
    @books = books
    @params = params
  end

  def call
    @books = @books.by_category(current_category) if current_category.present?
    # return @books = @books.joins(:order_items).select('books.*, sum(order_items.quantity) AS top').group(:id).order('top DESC') if params[:top_sort]
    # return @books = @books.includes(order_items: :order).order('order.completed.order_items.quantity') if params[:top_sort]
    return @books = @books.includes(:order_items).order('order_items.quantity ASC') if params[:top_sort]

    @books = @books.order("#{params[:sort]} #{params[:direction]}")
  end

  private

  attr_reader :params

  def current_category
    @current_category = (Category.find_by(id: params[:category_id]) || Category.new(id: nil, title: 'All')).id
  end
end
