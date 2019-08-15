# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderQuantity, type: :model do
  it { is_expected.to have_db_column(:quantity).of_type(:integer) }
end
