class RemoveAddressTypeFromAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_reference :addresses, :addressable, polymorphic: true, index: true
    remove_column :addresses, :address_type, :integer
  end
end
