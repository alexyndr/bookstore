# frozen_string_literal: true

class Address < ApplicationRecord
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
    code_country = ISO3166::Country[country]
    code_country.translations[I18n.locale.to_s] || code_country.name
  end
end
