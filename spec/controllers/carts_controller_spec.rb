# frozen_string_literal: true

RSpec.describe CartsController, type: :controller do
  describe 'GET #show' do
    before { get :show }

    it 'assign @order_items' do
      expect(assigns(:order_items)).not_to eq nil
    end

    it 'assign @discount' do
      expect(assigns(:discount)).not_to eq nil
    end

    context 'when status 200' do
      it { expect(response.status).to eq(200) }
      it { expect(response).to render_template :show }
    end
  end

  describe 'PUT #update' do
    before { put :update }

    context 'when update' do
      it { expect(response.status).to eq(302) }
      it { expect(response).to redirect_to cart_path }
    end
  end
end
