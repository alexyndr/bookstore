# frozen_string_literal: true

require 'rails_helper'

describe 'Log in', type: :feature do
  let(:user) { create(:user) }

  before do
    visit(new_user_session_path)
  end

  it 'when click log_in with empty fields' do
    click_button(I18n.t('devise.sign_in'))
    expect(page).to have_content I18n.t('devise.error_massage')
  end

  it 'when click log_in with full fields' do
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button(I18n.t('devise.sign_in'))
    expect(page).to have_content I18n.t('devise.my_account')
    expect(page).to have_current_path root_path
  end

  it 'when click forgot password' do
    click_link(I18n.t('devise.forgot_pass'))
    expect(page).to have_content I18n.t('devise.forgot_pass')
    expect(page).to have_current_path new_user_password_path
  end

  it 'when click sign_up link' do
    find('a', class: 'in-gold-500', text: I18n.t('devise.sign_up')).click
    expect(page).to have_current_path new_user_registration_path
  end
end
