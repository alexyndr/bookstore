# frozen_string_literal: true

RSpec.describe BooksController, type: :controller do
  let!(:book) { create(:book) }

  describe 'when #index' do
    before do
      get :index
    end

    it { is_expected.to respond_with 200 }

    it { is_expected.to render_template :index }
  end

  describe 'POST #show' do
    before do
      post :show, params: { id: book.id }
    end

    it '@order_quantity instance off OrderQuantity' do
      expect(assigns(:order_item)).to be_an_instance_of(OrderItem)
    end
  end

  describe 'GET #show' do
    before do
      post :show, params: { id: book.id }
    end

    it { expect(response).to have_http_status :ok }
  end

  describe 'when routes' do
    it { is_expected.to route(:get, '/books').to(action: :index) }
    it { is_expected.to route(:get, "/books/#{book.id}").to(action: :show, id: book.id) }
  end
end
