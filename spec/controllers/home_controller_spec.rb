# frozen_string_literal: true

RSpec.describe HomeController, type: :controller do
  let(:books) { create_list(:book, 10) }

  describe 'when #index' do
    before do
      get :index
    end

    it '@top_books instance exist' do
      expect(assigns(:top_books)).not_to be_nil
    end

    it '@newest instance exist' do
      expect(assigns(:newest)).not_to be_nil
    end

    it '@books instance exist' do
      expect(assigns(:books)).not_to be_nil
    end

    it { is_expected.to respond_with 200 }
  end

  describe 'when routes' do
    it { is_expected.to route(:get, '/').to(action: :index) }
  end
end
