# frozen_string_literal: true

class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    @sum_with_discount = sum_of_discount(coupon_show).round(2)
    @discount = subtotal_price - @sum_with_discount
  end

  def update
    @order_items = current_order.order_items
    @sum_with_discount = sum_of_discount(coupon_update).round(2)
    @discount = subtotal_price - @sum_with_discount
    render :show
  end

  private

  def coupon_show
    coupon = current_order.coupon # if current_order.coupon.present?
    if !coupon
      nil
    elsif coupon.order == current_order
      coupon
    end
  end

  def coupon_update
    coupon = Coupon.find_by(code: params[:code])
    if !coupon && current_order.coupon
      coupon = current_order.coupon
      coupon.update(order: nil)
      nil
    elsif !coupon && !current_order.coupon
      nil
    elsif coupon.active == true
      coupon.update(order: current_order)
      coupon
    elsif coupon.order == current_order && coupon.active == false
      coupon
    end
  end

  def discount_checker(coupon_action)
    coupon_action ? coupon_action.discount.to_f : 0
  end

  def sum_of_discount(coupon_action)
    ((100 - discount_checker(coupon_action)) / 100) * subtotal_price
  end
end
