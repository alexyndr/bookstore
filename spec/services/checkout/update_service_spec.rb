# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Checkout::UpdateManagerService do
  subject(:service) { described_class.new(order, fake_params, session) }

  let(:user) { create(:user) }
  let(:order) { create(:order, user: user) }
  let(:session) { { current_order_id: order.id } }
  let(:fake_params) { ActionController::Parameters.new(params) }

  describe 'address step' do
    let(:params) do
      { address: { billing: attributes_for(:address), use_billing: true,
                   shipping: attributes_for(:address) } }
    end

    it { expect(service.call(:address)).to eq true }
  end

  describe 'delivery step' do
    let(:delivery) { create(:delivery) }
    let(:params) { { order: { delivery_id: delivery.id } } }

    it { expect(service.call(:delivery)).to eq true }
  end

  describe 'payment step' do
    let(:params) { { card: attributes_for(:card) } }

    it { expect(service.call(:payment)).to eq Card.first }
  end

  describe 'confirm step' do
    let(:params) { {} }

    before { service.call(:confirm) }

    it { expect(session[:current_order_id]).to eq nil }
  end
end
