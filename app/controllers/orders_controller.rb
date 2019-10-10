# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.order_not_in_progress
    @orders = FilterStatusesQuery.call(@orders, status_params) if status_params
  end

  private

  def status_params
    %w[in_delivery delivered canceled].include?(params[:status]) ? params[:status] : nil
  end
end
