# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Coupon, type: :model do
  context 'with db colums' do
    it { is_expected.to have_db_column(:code).of_type(:string) }
    it { is_expected.to have_db_column(:active).of_type(:boolean) }
    it { is_expected.to have_db_column(:discount).of_type(:decimal) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:order).without_validating_presence }
  end

  describe 'scope' do
    it 'active' do
      expect(described_class.active).to eq described_class.where(active: true)
    end

    it 'not_active' do
      expect(described_class.not_active).to eq described_class.where(active: false)
    end
  end
end
