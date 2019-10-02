# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  helper_method :current_order, :item_total_price, :subtotal_price_sum

  def current_ability
    @current_ability ||= Ability.new(current_user, session)
  end

  def subtotal_price_sum
    current_order.order_items.sum { |item| item.quantity * item.book.price }
  end

  def item_total_price
    ((100 - (current_order.coupon ? current_order.coupon.discount.to_f : 0)) / 100) * subtotal_price_sum
  end

  def current_order
    @current_order ||= set_current_order
    @current_order = @current_order.in_progress? ? @current_order : set_current_order
  end

  private

  def set_current_order
    if current_user.present?
      order = current_user.orders.in_progress.first_or_create
      order.coupon = session_order.coupon if session_order.coupon
      order.order_items << session_order.order_items
      # session[:current_order_id] = order.id
      # session_order.delete
      # session_order_id
      return order
    end
    session_order
  end

  def session_order
    order = Order.find_by(id: session[:current_order_id])
    return order if order.present?

    order = Order.create
    session[:current_order_id] = order.id
    # session_order_id
    order
  end

  # def session_order_id
  #   session[:current_order_id] = order.id
  # end
end
