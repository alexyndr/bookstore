class RemoveCoverFromBooks < ActiveRecord::Migration[6.0]
  def change
    remove_column :books, :cover, :string
  end
end
