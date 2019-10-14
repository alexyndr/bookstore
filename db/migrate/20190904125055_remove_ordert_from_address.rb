class RemoveOrdertFromAddress < ActiveRecord::Migration[6.0]
  def change
    remove_reference :addresses, :order, null: false, foreign_key: true
  end
end
