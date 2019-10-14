# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :book

  scope :by_created, -> { order(created_at: :desc) }
end
