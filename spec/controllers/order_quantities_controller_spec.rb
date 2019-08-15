# frozen_string_literal: true

RSpec.describe OrderQuantitiesController, type: :controller do
  let!(:book) { create(:book) }

  describe 'POST #create' do
    let(:create_params) { { order_quantity: { book_id: book.id, quantity: 1 } } }

    before { post :create, xhr: true, params: create_params }

    it 'assign @order_quantity' do
      expect(assigns(:order_quantity)).not_to be_nil
    end

    it { expect(response).to have_http_status :ok }
  end
end
