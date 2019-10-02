# frozen_string_literal: true

class TopBooksQuery
  def initialize
    @orders = Order.where.not(status: :in_progress).where.not(status: :canceled)
  end

  def self.call
    new.call
  end

  def call
    ids = orders.joins(:order_items).group(:book_id).order('sum("order_items"."quantity") DESC').count.keys.first(4)
    Book.where(id: ids)
  end

  private

  attr_reader :orders
end
