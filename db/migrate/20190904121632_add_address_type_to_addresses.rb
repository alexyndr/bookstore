class AddAddressTypeToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :address_type, :integer
  end
end
