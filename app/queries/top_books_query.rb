# frozen_string_literal: true

class TopBooksQuery
  def self.call
    new.call
  end

  def call
    Book.joins(order_items: :order).where('(status <> 0) AND (status <> 4)')
    .select('books.*, sum(order_items.quantity) AS top').group(:id).order('top DESC')
  end

  private

  attr_reader :orders
end
