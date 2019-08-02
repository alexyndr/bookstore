# frozen_string_literal: true

# This class must doo...
class Book < ApplicationRecord
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors, dependent: :destroy
  # has_many :author
end
