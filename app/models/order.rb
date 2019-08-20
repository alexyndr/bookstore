# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :addresses, dependent: :destroy
  belongs_to :user, optional: true
end
