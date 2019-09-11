# frozen_string_literal: true

class Coupon < ApplicationRecord
  belongs_to :order, optional: true

  scope :active, -> { where active: true }
  scope :not_active, -> { where active: false }

  # validates :order_id, uniqueness: true
end
