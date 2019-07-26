# frozen_string_literal: true

# This class must doo...
class Author < ApplicationRecord
  has_many :books
end
