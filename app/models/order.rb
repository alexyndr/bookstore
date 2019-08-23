# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :addresses, dependent: :destroy
  belongs_to :user, optional: true

  enum status: {
    in_progress: 'in_progress',
    completed: 'completed',
    in_delivery: 'in_delivery',
    delivered: 'delivered',
    canceled: 'canceled'
  }
end
