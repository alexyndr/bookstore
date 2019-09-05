# frozen_string_literal: true

class OrderQuantitiesController < ApplicationController
  def create
    @order_quantity = OrderQuantity.new(order_params)
    @order_quantity.save
    redirect_back(fallback_location: root_path)
  end

  private

  def order_params
    params.require(:order_quantity).permit(:book_id, :quantity)
  end
end
