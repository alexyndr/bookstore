# frozen_string_literal: true

RSpec.describe BooksController, type: :controller do
  let!(:book) { create(:book) }

  describe 'when #index' do
    before do
      get :index
    end

    it { is_expected.to respond_with 200 }
  end

  describe 'POST #show' do
    before do
      post :show, params: { id: book.id }
    end

    it '@order_quantity instance off OrderQuantity' do
      expect(assigns(:order_quantity)).to be_an_instance_of(OrderQuantity)
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
