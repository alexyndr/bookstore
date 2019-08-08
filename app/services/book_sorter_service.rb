# frozen_string_literal: true

class BookSorterService
  attr_reader :params

  def initialize(books, params)
    @books = books
    @params = params
  end

  def call
    current_category
    present_category = @current_category.id
    @books = @books.by_category(present_category) if present_category.present?
    @books = @books.order("#{params[:sort]} #{params[:direction]}").page(params[:page])
  end

  private

  def current_category
    @current_category = Category.find_by(id: params[:category_id]) || Category.new(id: nil, title: 'All')
  end
end
