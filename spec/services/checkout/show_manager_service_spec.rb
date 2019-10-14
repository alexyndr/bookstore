# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Checkout::ShowManagerService do
  subject(:service) { described_class.new(order, user) }

  let(:user) { create(:user) }
  let(:order) { create(:order, :add_addresses, :add_coupon, user: user) }

  describe 'address step' do
    it { expect(service.call(:address)).to eq true }
  end

  describe 'delivery step' do
    it { expect(service.call(:delivery)).to eq Delivery.all }
  end

  describe 'payment step' do
    let!(:card) { create(:card, order: order) }

    it { expect(service.call(:payment)).to eq Card.first }
  end

  describe 'confirm step' do
    let!(:card) { create(:card, order: order) }

    it { expect(service.call(:payment)).to eq Card.first }
  end

  describe 'complete step' do
    it { expect(service.call(:complete)).to eq order }
  end
end
