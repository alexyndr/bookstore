# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderQuantity, type: :model do
  context 'with db columns' do
    it { is_expected.to have_db_column(:quantity).of_type(:integer) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:book) }
  end
end
