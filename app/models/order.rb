# frozen_string_literal: true

class Order < ApplicationRecord
  attr_accessor :active_admin_requested_event
  include AASM

  has_many :addresses, as: :addressable, dependent: :destroy
  # has_many :addresses, dependent: :destroy
  belongs_to :user, optional: true

  has_one :coupon, dependent: :destroy
  # has_many :books, through: :order_quantities
  has_many :order_items, dependent: :destroy

  enum status: {
    in_progress: 0,
    completed: 1,
    in_delivery: 2,
    delivered: 3,
    canceled: 4
  }

  aasm column: :status, enum: true do
    state :in_progress, initial: true
    state :completed
    state :in_delivery
    state :delivered
    state :canceled

    event :completed do
      transitions from: :in_progress, to: :completed
    end

    event :in_delivery do
      transitions from: :completed, to: :in_delivery
    end

    event :delivered do
      transitions from: :in_delivery, to: :delivered
    end

    event :canceled do
      transitions from: %i[in_progress completed in_delivery delivered], to: :canceled
    end
  end
end
