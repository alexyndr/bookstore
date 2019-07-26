# frozen_string_literal: true

class AddAuthorRefToBook < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :author, foreign_key: true
    # add_reference :books, :author, null: false, foreign_key: true
  end
end
