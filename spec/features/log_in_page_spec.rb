# frozen_string_literal: true

require 'rails_helper'

describe 'Log in', type: :feature do
  let(:user) { create(:user) }
  let(:error_massage) { 'Invalid Email or password.' }
  let(:my_account) { 'My account' }

  before do
    visit(new_user_session_path)
  end

  it 'when click log_in with empty fields' do
    click_button('Sign In')
    expect(page).to have_content error_massage
  end

  it 'when click log_in with full fields' do
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button('Sign In')
    expect(page).to have_content my_account
    expect(page).to have_current_path root_path
  end

  it 'when click forgot password' do
    # find('a', text: 'Forgot your password?').click
    click_link(I18n.t('forgot_pass'))
    expect(page).to have_content 'Forgot your password'
    expect(page).to have_current_path new_user_password_path
  end

  it 'when click sign_up link' do
    find('a', class: 'in-gold-500', text: 'Sign Up').click
    # click_link('Sign Up', href: "/users/sign_up")
    expect(page).to have_current_path new_user_registration_path
  end
end
