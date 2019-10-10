require 'rails_helper'

RSpec.describe Card, type: :model do
  context 'with db colums' do
    it { is_expected.to have_db_column(:number).of_type(:string) }
    it { is_expected.to have_db_column(:card_holder).of_type(:string) }
    it { is_expected.to have_db_column(:valid_thru).of_type(:string) }
    it { is_expected.to have_db_column(:cvv).of_type(:string) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:card_holder) }
    it { is_expected.to validate_presence_of(:valid_thru) }
    it { is_expected.to validate_presence_of(:cvv) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:order).dependent(:destroy) }
  end
end
