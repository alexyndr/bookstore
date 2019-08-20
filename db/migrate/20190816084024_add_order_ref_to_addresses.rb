class AddOrderRefToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :order, foreign_key: true
  end
end
