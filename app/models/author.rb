# frozen_string_literal: true

# This class must doo...
class Author < ApplicationRecord
  has_many :book_authors, dependent: :destroy
  has_many :books, through: :book_authors

  validates :name, presence: true, uniqueness: true

end
