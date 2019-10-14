# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :order, dependent: :destroy

  validates :number, :card_holder, :valid_thru, :cvv, presence: true

  validates :card_holder, length: { maximum: 50 }
  validates :number, length: { is: 16 }
  validates :cvv, length: { is: 3 }
  validates :number, :cvv, numericality: { only_integer: true }

  validates :card_holder, format: /\A[a-zA-Z]*\s*[a-zA-Z]*\z/
  validates :valid_thru, format: %r{\A(0[1-9]|10|11|12)/\d{2}\z}
end
