class AddBillingAddressToOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :billing_address, index: true
    add_reference :orders, :shipping_address, index: true

    add_foreign_key :orders, :addresses, column: :billing_address_id
    add_foreign_key :orders, :addresses, column: :shipping_address_id
  end
end
