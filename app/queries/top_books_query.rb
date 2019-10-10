# frozen_string_literal: true

class TopBooksQuery
  def self.call
    Book.joins(order_items: :order).where('(status <> 0) AND (status <> 4)')
        .select('books.*, sum(order_items.quantity) AS top').group(:id).order('top DESC').first(4)
  end
end
