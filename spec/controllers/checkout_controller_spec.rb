# frozen_string_literal: true

RSpec.describe CheckoutController, type: :controller do
  let(:user) { create(:user) }

  STEPS = %i[login address delivery payment confirm complete].freeze

  before { allow(controller).to receive(:current_order).and_return(order) }

  describe 'GET #show' do
    let(:order) { create(:order, :add_addresses, :add_delivery, user: user, compleated_at: Time.now) }
    let!(:card) { create(:card, order: order) }
    let!(:order_items) { create_list(:order_item, 2, order: order) }

    context 'when status 200' do
      STEPS.each do |step|
        it "#{step.capitalize} step" do
          get :show, params: { id: step }
          expect(subject).to respond_with(200)
          expect(subject).to render_template step.to_s
        end
      end
    end

    context 'when status 302' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        get :show, params: { id: STEPS[0] }
      end

      it { expect(subject).to respond_with(302) }
    end
  end

  describe 'PUT #update' do
    let(:order) { create(:order, user: user) }
    let(:delivery) { create(:delivery) }
    let(:card) { attributes_for(:card) }
    let(:address_params) do
      { billing: attributes_for(:address, first_name: 'Ali'),
        shipping: attributes_for(:address) }
    end

    context 'when login step' do
      before do
        allow(controller).to receive(:current_user).and_return(user)
        put :update, params: { id: STEPS[0] }
      end

      it { expect(order.user).to eq user }
    end

    context 'when address step' do
      before { put :update, params: { id: STEPS[1], address: address_params, use_billing: true } }

      it { expect(order.shipping_address).not_to eq nil }

      it { expect(order.billing_address).not_to eq nil }
    end

    context 'when delivery step' do
      before { put :update, params: { id: STEPS[2], order: { delivery_id: delivery.id } } }

      it { expect(order.delivery).to eq delivery }
    end

    context 'when payment step' do
      before { put :update, params: { id: STEPS[3], card: card } }

      it { expect(order.card).not_to eq nil }
    end

    context 'when confirm step' do
      before { put :update, params: { id: STEPS[4] } }

      it { expect(order.compleated_at).not_to eq nil }
    end
  end
end
