# frozen_string_literal: true

class SorterBooksQuery
  def initialize(books, params)
    @books = books
    @params = params
  end

  def call
    @books = @books.by_category(current_category) if current_category.present?
    @books = @books.order("#{params[:sort]} #{params[:direction]}")
  end

  private

  attr_reader :params

  def current_category
    @current_category = (Category.find_by(id: params[:category_id]) || Category.new(id: nil, title: 'All')).id
  end
end
