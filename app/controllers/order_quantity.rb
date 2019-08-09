# frozen_string_literal: true

class OrderQuantity < ApplicationController
  def new
    @order_quantity = OrderQuantity.create(order_params)
  end

  private

  def order_params
    params.permit(:order).permit(:quantity, :book.id)
  end
end
