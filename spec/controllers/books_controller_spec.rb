# frozen_string_literal: true

RSpec.describe BooksController, type: :controller do
  describe 'when #index' do
    before do
      get :index
    end

    it { is_expected.to respond_with 200 }
  end

  describe 'when routes' do
    it { is_expected.to route(:get, '/books').to(action: :index) }
  end
end
