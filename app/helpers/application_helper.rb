# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def price_euro(price)
    number_to_currency(price, unit: '€')
  end
end
