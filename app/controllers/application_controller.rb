# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  # rescue_from ActiveRecord::RecordNotFound do |exception|
  #   render head: exception, status: 404
  # end

  helper_method :current_order, :subtotal_price

  # def current_order
  #   Order.find_or_initialize_by(id: session[:order_id])
  # end

  # def after_sign_in_path_for(resource)
  #   checkout_path(:address)
  # end

  def current_ability
    @current_ability ||= Ability.new(current_user, session)
  end

  def subtotal_price
    total_sum = current_order.order_items.map { |item| item.quantity * item.book.price }
    total_sum.sum
  end

  def current_order
    # @current_order ||= begin
    #   order = Order.find_by(id: session[:current_order_id])
    #   order.update(user_id: current_user.id) if current_user.present? && order
    #   return order if order.present?

    #   order = Order.create
    #   order.update(user_id: current_user.id) if current_user.present?
    #   session[:current_order_id] = order.id
    #   order

    #   if current_user
    #     if current_user.order.in_progress
    #       order = Order.find_by(id: session[:current_order_id])

    # end
    @current_order ||= set_current_order
  end

  def set_current_order
    if current_user.present?
      order = current_user.orders.first_or_create(status: :in_progress)
      order.order_items << session_order.order_items
      return order

      # order.order_items << session_order.order_items
      # order = Order.find_by(id: session[:current_order_id])
      # if order
      #   order.update(user_id: current_user.id)
      #   return order
      # end
      # return current_user.create_order
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
