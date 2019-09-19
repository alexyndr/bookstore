class AddBillingAddressToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :billing_address, index: true
    add_reference :users, :shipping_address, index: true

    add_foreign_key :users, :addresses, column: :billing_address_id
    add_foreign_key :users, :addresses, column: :shipping_address_id
  end
end
