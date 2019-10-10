# frozen_string_literal: true

RSpec.describe AddressesController, type: :controller do
  let!(:user) { create(:user) }

  before { sign_in(user) }

  context 'when GET #edit' do
    it 'return a success response' do
      get :edit
      assert_response :success
    end

    it 'creates address_shipping' do
      expect(assigns(:address_shipping)).to be(initialize)
    end

    it 'creates address_billing' do
      expect(assigns(:address_billing)).to be(initialize)
    end
  end

  context 'when PATCH #update' do
    let(:address_params) do
      { address: attributes_for(:address) }
    end

    before { patch :update, params: address_params }

    it 'assigns address_shipping' do
      expect(assigns(:address_shipping)).not_to be_nil
    end

    it 'assigns address_billing' do
      expect(assigns(:address_billing)).not_to be_nil
    end

    it 'creates address' do
      expect(response).to render_template(:edit)
    end

    it 'return a success response' do
      expect(response).to have_http_status(:ok)
    end
  end
end
