# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:user) { create(:user) }
  let(:address) { create(:address, address_type: 0, addressable: user)}
  # let!(:bil_address) { create_list(:address, 5, address_type: 0) }
  # let!(:ship_address) { create_list(:address, 5, address_type: 1) }

  context 'with db colums' do
    it { is_expected.to have_db_column(:first_name).of_type(:string) }
    it { is_expected.to have_db_column(:last_name).of_type(:string) }
    it { is_expected.to have_db_column(:address).of_type(:string) }
    it { is_expected.to have_db_column(:city).of_type(:string) }
    it { is_expected.to have_db_column(:country).of_type(:string) }
    it { is_expected.to have_db_column(:phone_number).of_type(:string) }
    it { is_expected.to have_db_column(:zip).of_type(:integer) }
    it { is_expected.to have_db_column(:address_type).of_type(:integer) }
  end

  # describe 'associations' do
  #   it { is_expected.to belong_to(:user).without_validating_presence }
  #   it { is_expected.to belong_to(:order).without_validating_presence }
  # end

  describe 'status enum value' do
    it { expect(described_class.addresses_types[:billing]).to eq(0) }
    it { expect(described_class.addresses_types[:shipping]).to eq(1) }
  end

  it "has a polymorphic relationship" do
    expect(subject).to belong_to(:addressable)
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:zip) }
    it { is_expected.to validate_presence_of(:phone_number) }
  end

  # describe 'billing scope' do
  #   it { expect(described_class.billing_address.first).to be_instance_of(BillingAddress) }
  #   it { expect(described_class.billing_address).to eq described_class.where(type: 'BillingAddress') }
  # end

  # describe 'shipping scope' do
  #   it { expect(described_class.shipping_address.first).to be_instance_of(ShippingAddress) }
  #   it { expect(described_class.shipping_address).to eq described_class.where(type: 'ShippingAddress') }
  # end
end
