# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'with db colums' do
    it { is_expected.to have_db_column(:number).of_type(:integer) }
    it { is_expected.to have_db_column(:status).of_type(:string) }
    it { is_expected.to have_db_column(:compleated_at).of_type(:datetime) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user).without_validating_presence }
    it { is_expected.to have_many(:addresses).dependent(:destroy) }
  end

  describe 'status enum value' do
    it { expect(described_class.statuses[:in_progress]).to eq('in_progress') }
    it { expect(described_class.statuses[:completed]).to eq('completed') }
    it { expect(described_class.statuses[:in_delivery]).to eq('in_delivery') }
    it { expect(described_class.statuses[:delivered]).to eq('delivered') }
    it { expect(described_class.statuses[:canceled]).to eq('canceled') }
  end
end
