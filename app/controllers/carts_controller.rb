# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    return if current_order.nil?

    @order_items = current_order.order_items
    @discount = subtotal_price_sum - item_total_price
  end

  def update
    coupon_update
    redirect_back(fallback_location: root_path)
  end

  private

  def coupon_update
    user_coupon = Coupon.find_by(active: true, code: params[:code])
    if user_coupon
      user_coupon.update(order: current_order)
    else
      current_order.coupon&.update(order: user_coupon, active: true)
    end
    user_coupon
  end
end
