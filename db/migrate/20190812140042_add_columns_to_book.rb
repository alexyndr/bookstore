class AddColumnsToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :cover, :string
    add_column :books, :materials, :string
    add_column :books, :depth, :decimal
    add_column :books, :height, :decimal
    add_column :books, :width, :decimal
    add_column :books, :publication_year, :integer
  end
end
