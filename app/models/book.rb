# frozen_string_literal: true

# This class must doo...
class Book < ApplicationRecord
  belongs_to :author
  # has_many :author
end
