# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  helper_method :current_order

  def current_ability
    @current_ability ||= Ability.new(current_user, session)
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
      return order
    end
    session_order
  end

  def session_order
    order = Order.find_by(id: session[:current_order_id])
    return order if order.present?

    order = Order.create
    session[:current_order_id] = order.id
    order
  end
end
