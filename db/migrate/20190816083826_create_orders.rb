class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :number
      t.integer :status, default: 0
      t.datetime :compleated_at

      t.timestamps
    end
  end
end
