# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  context 'with db columns' do
    it { is_expected.to have_db_column(:quantity).of_type(:integer) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:book) }
  end

  describe 'scope' do
    it 'by_created' do
      expect(described_class.by_created).to eq described_class.order(created_at: :desc)
    end
  end
end
