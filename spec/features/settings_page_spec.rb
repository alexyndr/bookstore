# frozen_string_literal: true

require 'rails_helper'

describe 'Settings page', type: :feature do
  let!(:user) { create(:user) }
  let(:address_params) { attributes_for(:address) }

  before do
    login_as(user, scope: :user)
    visit settings_addresses_path
  end

  context 'when billing' do
    let(:billing) { user.create_billing_address(attributes_for(:address)) }

    it 'when go to settings page' do
      expect(page).to have_current_path settings_addresses_path
      expect(page).to have_content('Settings')
    end

    it 'when empty fields' do
      first('input[type=submit]').click
      expect(page).to have_content "can't be blank"
    end

    it 'billing address exists' do
      billing
      user.save
      visit settings_addresses_path
      expect(page).to have_field 'address[first_name]', with: billing.first_name
    end

    it 'valid input' do
      within '#billing' do
        fill_in('address[first_name]', with: address_params[:first_name])
        fill_in('address[last_name]', with: address_params[:last_name])
        fill_in('address[address]', with: address_params[:address])
        fill_in('address[city]', with: address_params[:city])
        fill_in('address[zip]', with: address_params[:zip])
        fill_in('address[phone_number]', with: address_params[:phone_number])
        select(address_params[:country], from: 'address[country]')
        first('input[type=submit]').click
        expect(Address.count).to eq(1)
      end
    end
  end

  context 'when shipping' do
    let(:shipping) { user.create_shipping_address(attributes_for(:address)) }

    it 'shipping address exists' do
      shipping
      user.save
      visit settings_addresses_path
      expect(page).to have_field 'address[first_name]', with: shipping.first_name
    end

    it 'valid input' do
      within '#shipping' do
        fill_in('address[first_name]', with: address_params[:first_name])
        fill_in('address[last_name]', with: address_params[:last_name])
        fill_in('address[address]', with: address_params[:address])
        fill_in('address[city]', with: address_params[:city])
        fill_in('address[zip]', with: address_params[:zip])
        fill_in('address[phone_number]', with: address_params[:phone_number])
        select(address_params[:country], from: 'address[country]')
        first('input[type=submit]').click
        expect(Address.count).to eq(1)
      end
    end
  end
end
