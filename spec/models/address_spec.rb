# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  let!(:bil_address) { create_list(:address, 5, type: 'BillingAddress') }
  let!(:ship_address) { create_list(:address, 5, type: 'ShippingAddress') }

  context 'with db colums' do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:address).of_type(:string) }
    it { is_expected.to have_db_column(:city).of_type(:string) }
    it { is_expected.to have_db_column(:country).of_type(:string) }
    it { is_expected.to have_db_column(:phone_number).of_type(:string) }
    it { is_expected.to have_db_column(:zip).of_type(:integer) }
    it { is_expected.to have_db_column(:type).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user).without_validating_presence }
    it { is_expected.to belong_to(:order).without_validating_presence }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
  end

  describe 'billing scope' do
    it { expect(described_class.billing_address.first).to be_instance_of(BillingAddress) }
  end

  describe 'shipping scope' do
    it { expect(described_class.shipping_address.first).to be_instance_of(ShippingAddress) }
  end
end
