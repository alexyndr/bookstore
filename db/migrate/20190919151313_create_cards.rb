class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :number
      t.string :card_holder
      t.string :valid_thru
      t.string :cvv
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
