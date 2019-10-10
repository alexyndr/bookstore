# frozen_string_literal: true

class Order < ApplicationRecord
  attr_accessor :active_admin_requested_event
  include AASM

  belongs_to :shipping_address, class_name: 'Address', optional: true, autosave: true
  belongs_to :billing_address, class_name: 'Address', optional: true, autosave: true

  belongs_to :user, optional: true
  belongs_to :delivery, optional: true

  has_one :coupon, dependent: :destroy
  has_one :card, dependent: :destroy

  has_many :order_items, dependent: :destroy

  after_create :set_number

  scope :order_not_in_progress, -> { where.not(status: :in_progress) }

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

  def total
    price_with_disc + (delivery&.price || 0.00)
  end

  def subtotal_price
    order_items.sum { |item| item.quantity * item.book.price }
  end

  def discount
    subtotal_price - price_with_disc || 0.00
  end

  def price_with_disc
    ((100 - (coupon ? coupon.discount.to_f : 0)) / 100) * subtotal_price
  end

  private

  def set_number
    update(number: "R#{id.to_s.rjust(8, '0')}")
  end
end
