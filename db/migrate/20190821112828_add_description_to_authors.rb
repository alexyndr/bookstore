class AddDescriptionToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :description, :string
  end
end
