# frozen_string_literal: true

class BookAuthor < ApplicationRecord
  belongs_to :author
  belongs_to :book
end
