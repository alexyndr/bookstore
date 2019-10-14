# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items.by_created
    @discount = current_order.discount
    @subtotal_price_sum = current_order.subtotal_price
    @item_total_price = current_order.price_with_disc
  end

  def update
    user_coupon = Coupon.find_by(active: true, code: params[:code])
    if user_coupon
      user_coupon.update(order: current_order)
    else
      current_order.coupon&.update(order: user_coupon, active: true)
    end
    redirect_to cart_path
  end
end
