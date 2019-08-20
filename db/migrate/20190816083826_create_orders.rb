class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :number
      t.string :status
      t.datetime :compleated_at

      t.timestamps
    end
  end
end
