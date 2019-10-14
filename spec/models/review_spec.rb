# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'with db colums' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:text).of_type(:text) }
    it { is_expected.to have_db_column(:score).of_type(:integer) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user).without_validating_presence }
    it { is_expected.to belong_to(:book) }
  end

  describe 'status enum value' do
    it { expect(described_class.statuses[:waiting]).to eq(0) }
    it { expect(described_class.statuses[:approved]).to eq(1) }
    it { expect(described_class.statuses[:rejected]).to eq(2) }
  end

  describe 'scopes' do
    it 'approved' do
      expect(described_class.approved).to eq described_class.where(status: 1)
    end
  end

  describe 'aasm' do
    it { is_expected.to transition_from(:waiting).to(:approved).on_event(:approved, :rejected) }
    it { is_expected.to transition_from(:approved).to(:rejected).on_event(:rejected) }
  end
end
