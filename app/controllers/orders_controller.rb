# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.where.not(status: :in_progress)
    @orders = @orders.where(status: status_params) if params[:status]
  end

  private

  def status_params
    %w[in_delivery delivered canceled].include?(params[:status]) ? params[:status] : nil
  end
end
