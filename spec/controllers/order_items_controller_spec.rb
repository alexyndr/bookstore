# frozen_string_literal: true

RSpec.describe OrderItemsController, type: :controller do
  let!(:book) { create(:book) }

  describe 'POST #create' do
    let(:create_params) { { order_item: { book_id: book.id, quantity: 1 } } }

    before { post :create, xhr: true, params: create_params }

    it 'assign @order_item' do
      expect(assigns(:order_item)).not_to be_nil
    end

    it { expect(response).to have_http_status :ok }
  end
end
