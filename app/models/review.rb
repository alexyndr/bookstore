# frozen_string_literal: true

class Review < ApplicationRecord
  attr_accessor :active_admin_requested_event
  include AASM

  belongs_to :user
  belongs_to :book

  validates :title, :text, :score, presence: true
  validates :score, numericality: true

  enum status: {
    waiting: 0,
    approved: 1,
    rejected: 2
  }

  aasm column: :status, enum: true do
    state :waiting, initial: true
    state :approved
    state :rejected

    event :approved do
      transitions from: :waiting, to: :approved
    end

    event :rejected do
      transitions from: %i[waiting approved], to: :rejected
    end
  end
end
