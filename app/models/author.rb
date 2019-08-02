# frozen_string_literal: true

# This class must doo...
class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors, dependent: :destroy
  # validates :email, presence: { strict: true }

  # after_initialize do |user|
  #   puts "Whhy strics say that user: #{user.name} is"
  # end
end
