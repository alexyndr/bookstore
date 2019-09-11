# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    # @price = @orders.item.book.price * @orders.item.queries
  end

  def update
    @order_items = current_order.order_items
    @final_sum = discount_to_percent.round(2)
    @discount = subtotal_price - @final_sum
    render :show
  end

  private

  def coupon_discount
    Coupon.find_by(active: true, code: params[:code])
  end

  def discount_checker
    coupon_discount ? coupon_discount.discount.to_f : 0
  end

  def discount_to_percent
    ((100 - discount_checker) / 100) * subtotal_price
  end
end
