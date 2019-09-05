class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :text
      t.integer :score
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
