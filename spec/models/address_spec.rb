# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'with db colums' do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:address).of_type(:string) }
    it { is_expected.to have_db_column(:city).of_type(:string) }
    it { is_expected.to have_db_column(:country).of_type(:string) }
    it { is_expected.to have_db_column(:phone_number).of_type(:string) }
    it { is_expected.to have_db_column(:zip).of_type(:integer) }
  end

  # describe 'associations' do
  #   # it { should have_many(:users).class_name('Address').with_foreign_key(:shipping_address) }
  #   # it { should have_many(:users).without_validating_presence }
  # end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:zip) }
    it { is_expected.to validate_presence_of(:phone_number) }
  end
end
