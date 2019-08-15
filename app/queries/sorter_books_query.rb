# frozen_string_literal: true

class SorterBooksQuery
  def initialize(books, params)
    @books = books
    @params = params
  end

  def call
    # filter_by_category
    # sort
    @books = @books.by_category(current_category) if current_category.present?
    @books = @books.order("#{params[:sort]} #{params[:direction]}")
  end

  private

  attr_reader :params

  # def filter_by_category
  #   return unless current_category.present?

  #   @books = @books.by_category(current_category)
  # end

  # def sort
  #   return unless params[:sort].present?

  #   @books = @books.order("#{params[:sort]} #{params[:direction]}")
  # end

  def current_category
    @current_category = (Category.find_by(id: params[:category_id]) || Category.new(id: nil, title: 'All')).id
  end

  # def initialize(books, params)
  #   @books = books
  #   @params = params
  # end

  # def call
  #   books = books.by_category(current_category_id) if current_category_id.present?
  #   books = books.order("#{params[:sort]} #{params[:direction]}")
  # end

  # private

  # attr_reader :params, :books

  # def current_category_id
  #   @current_category_id ||= begin
  #     (Category.find_by(id: params[:category_id]) || Category.new(id: nil, title: 'All')).id
  #   end
  # end
end
