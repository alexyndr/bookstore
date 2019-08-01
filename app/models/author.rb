# frozen_string_literal: true

# This class must doo...
class Author < ApplicationRecord
  has_many :books
  validates :email, presence: { strict: true }

  # after_initialize do |user|
  #   puts "Whhy strics say that user: #{user.name} is"
  # end
end
