class CreateOrderQuantities < ActiveRecord::Migration[6.0]
  def change
    create_table :order_quantities do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
