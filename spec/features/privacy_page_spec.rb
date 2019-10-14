# frozen_string_literal: true

require 'rails_helper'

describe 'Privacy page', type: :feature do
  let(:user) { create(:user) }
  let(:user_attributes) { attributes_for(:user) }
  let(:new_email) { 'safe@safe.com' }

  before do
    login_as(user, scope: :user)
    visit settings_path
  end

  context 'when change email' do
    let(:new_email) { user_attributes[:email] }

    it 'when empty field' do
      fill_in 'user[email]', with: ''
      click_on(id: 'email_btn')
      expect(page).to have_content I18n.t('addresses.blank_email')
    end

    it 'when successful change email' do
      fill_in 'user[email]', with: new_email
      click_on(id: 'email_btn')
      expect(page).to have_content I18n.t('devise.email_changed')
    end
  end

  context 'when change password' do
    let(:new_password) { '111111' }

    it 'when empty fields' do
      fill_in 'user[current_password]', with: ''
      fill_in 'user[password]', with: ''
      fill_in 'user[password_confirmation]', with: ''
      click_on(id: 'pass_btn')
      expect(page).to have_content I18n.t('addresses.blank_password')
    end

    it 'when successful change password' do
      fill_in 'user[current_password]', with: user.password
      fill_in 'user[password]', with: new_password
      fill_in 'user[password_confirmation]', with: new_password
      click_on(id: 'pass_btn')
      expect(page).to have_current_path root_path
    end
  end

  context 'when delete account' do
    it 'checked delete account' do
      find('span', class: 'checkbox-icon').set(true)
      find('#destroy_confirmation_button').click
      expect(page).to have_current_path root_path
    end
  end
end
