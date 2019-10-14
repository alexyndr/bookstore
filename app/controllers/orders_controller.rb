# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders = FilterStatusesQuery.call(current_user, status_params)
  end

  private

  def status_params
    %w[in_delivery delivered canceled].include?(params[:status]) ? params[:status] : nil
  end
end
