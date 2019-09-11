class AddOrderRefToCoupon < ActiveRecord::Migration[6.0]
  def change
    add_reference :coupons, :order, foreign_key: true
  end
end
