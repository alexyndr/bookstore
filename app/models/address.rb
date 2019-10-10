# frozen_string_literal: true

class Address < ApplicationRecord
  # has_many :orders, dependent: :destroy
  # has_many :users, foreign_key: :shipping_address_id, dependent: :destroy

  validates :first_name, :last_name,
            presence: true,
            format: { with: /\A[a-zA-Z]*\z/,
                      message: 'Consist of a-z, A-Z only, no special symbols' },
            length: { maximum: 50 }

  validates :address, :city, :country,
            presence: true,
            format: { with: /\A[a-zA-Z0-9 \-\,]*\z/,
                      message: 'Consist of a-z, A-Z, 0-9,’,’, ‘-’, ‘ ’ only, \
                      no special symbols' },
            length: { maximum: 50 }

  validates :zip,
            presence: true,
            format: { with: /\A[0-9 ]*\z/,
                      message: 'Consist of 0-9, ’ ’ only, no special symbols' },
            length: { maximum: 10 }

  validates :phone_number,
            presence: true,
            format: { with: /\A\+[0-9]*\z/,
                      message: 'Consist of + 0-9 only no special symbols' },
            length: { maximum: 15 }

  def country_name
    c = ISO3166::Country[country]
    c.translations[I18n.locale.to_s] || c.name
  end
end
