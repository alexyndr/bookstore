# frozen_string_literal: true

def price
  number_to_currency(price, unit: '€')
end
