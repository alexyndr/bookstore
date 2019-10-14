# frozen_string_literal: true

require 'rails_helper'

describe 'Sign up', type: :feature do
  let(:attributes) { attributes_for(:user) }

  before do
    visit(new_user_registration_path)
  end

  it 'when click sign_up with wrong email' do
    fill_in 'user[email]', with: ''
    fill_in 'user[password]', with: attributes[:password]
    fill_in 'user[password_confirmation]', with: attributes[:password]
    click_button(I18n.t('devise.sign_up'))
    expect(page).to have_content I18n.t('book_pages.blank')
  end

  it 'when click sign_up with full fields' do
    fill_in 'user[email]', with: attributes[:email]
    fill_in 'user[password]', with: attributes[:password]
    fill_in 'user[password_confirmation]', with: attributes[:password]
    click_button(I18n.t('devise.sign_up'))
    expect(page).to have_current_path root_path
  end

  it 'when click sign_up link' do
    find('a', class: 'in-gold-500', text: I18n.t('devise.log_in')).click
    expect(page).to have_current_path new_user_session_path
  end
end
