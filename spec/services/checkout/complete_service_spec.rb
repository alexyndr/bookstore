# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Checkout::CompleteService do
  subject(:service) { described_class.new(order, user) }

  let(:user) { create(:user) }

  describe 'address step' do
    let(:order) { create(:order, user: user) }

    it { expect(service.call(:address)).to eq user }
  end

  describe 'delivery step' do
    let(:order) { create(:order, :add_addresses) }

    it { expect(service.call(:delivery)).to eq true }
  end

  describe 'payment step' do
    let(:delivery) { create(:delivery) }
    let(:order) { create(:order, delivery: delivery) }

    it { expect(service.call(:payment)).to eq order.delivery }
  end

  describe 'confirm step' do
    let(:card) { create(:card, order: order) }
    let(:order) { create(:order) }

    it { expect(service.call(:confirm)).to eq order.card }
  end

  describe 'complete step' do
    let(:order) { create(:order, compleated_at: Time.now) }

    it { expect(service.call(:complete)).to eq order.compleated_at? }
  end
end
