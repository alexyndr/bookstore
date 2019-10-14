# frozen_string_literal: true

class FilterStatusesQuery
  def self.call(user, params)
    orders = user.orders.order_not_in_progress
    orders = orders.where(status: params) if params
    orders
  end
end
