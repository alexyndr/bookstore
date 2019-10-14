class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.string :code, unique: true
      t.boolean :active, default: true
      t.decimal :discount, default: 5

      t.timestamps
    end
  end
end
