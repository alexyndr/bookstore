# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :order, optional: true

  validates :first_name, :last_name, :city, :country,
            presence: true,
            format: { with: /\A[a-zA-Z]*\z/,
                      message: 'Consist of a-z, A-Z only, no special symbols' },
            length: { maximum: 50 }

  validates :address,
            presence: true,
            format: { with: /\A[a-zA-Z0-9 \-\,]*\z/,
                      message: 'Consist of a-z, A-Z, 0-9,’,’, ‘-’, ‘ ’ only, \
                      no special symbols' },
            length: { maximum: 50 }

  validates :zip,
            presence: true,
            numericality: { only_integer: true,
                            message: 'Consist of 0-9 only,’-’ no special symbols' },
            length: { maximum: 10 }

  validates :phone_number,
            presence: true,
            format: { with: /\A\+[0-9]*\z/,
                      message: 'Consist of 0-9 only no special symbols' },
            length: { maximum: 15 }

  scope :billing_address, -> { where(type: 'BillingAddress') }
  scope :shipping_address, -> { where(type: 'ShippingAddress') }
end
