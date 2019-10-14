# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  before { sign_in(user) }

  context 'when PATCH update_email' do
    let(:email_params) do
      { user: { email: user.email } }
    end

    before { patch :update_email, params: email_params }

    it 'returns redirect response' do
      expect(response).to have_http_status(:found)
    end

    it 'flash success' do
      expect(flash[:success]).to eq I18n.t('devise.email_changed')
    end
  end

  context 'when PATCH update password' do
    let(:password_params) do
      { user: { current_password: user.password, password_confirmation: '111111', password: '111111' } }
    end

    before { patch :update_password, params: password_params }

    it 'returns redirect response' do
      expect(response).to have_http_status(:found)
    end

    it 'flash success' do
      expect(flash[:success]).to eq I18n.t('devise.pass_changed')
    end
  end
end
