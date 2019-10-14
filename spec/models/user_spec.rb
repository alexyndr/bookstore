# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with db colums' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:image).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:shipping_address).class_name('Address').without_validating_presence }
    it { is_expected.to belong_to(:billing_address).class_name('Address').without_validating_presence }
    it { is_expected.to have_many(:reviews).without_validating_presence }
    it { is_expected.to have_many(:orders).without_validating_presence }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :encrypted_password }
  end
end
