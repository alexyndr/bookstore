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

  def current_ability
    @current_ability ||= Ability.new(current_user, session)
  end

  def subtotal_price
    total_sum = current_order.order_items.map { |item| item.quantity * item.book.price }
    total_sum.sum
  end

  def current_order
    @current_order ||= begin
      order = Order.find_by(id: session[:current_order_id])
      return order if order.present?

      order = Order.create
      session[:current_order_id] = order.id
      order
    end
  end
end
