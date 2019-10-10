class FilterStatusesQuery
  def self.call(orders, params)
    orders.where(status: params)
  end
end