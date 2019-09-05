# frozen_string_literal: true

require 'rails_helper'

describe 'Settings page', type: :feature do
  let!(:user) { create(:user) }
  let(:billing_params) { attributes_for(:address, address_type: 0) }
  let(:shipping_params) { attributes_for(:address, address_type: 1) }

  before do
    login_as(user, scope: :user)
    visit settings_addresses_path
  end

  context 'when billing' do
    let(:billing) { user.addresses.create(attributes_for(:address, address_type: 0)) }

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
      visit settings_addresses_path
      expect(page).to have_field 'address[first_name]', with: billing.first_name
    end

    it 'valid input' do
      within '#billing' do
        fill_in('address[first_name]', with: billing_params[:first_name])
        fill_in('address[last_name]', with: billing_params[:last_name])
        fill_in('address[address]', with: billing_params[:address])
        fill_in('address[city]', with: billing_params[:city])
        fill_in('address[zip]', with: billing_params[:zip])
        fill_in('address[phone_number]', with: billing_params[:phone_number])
        select(billing_params[:country], from: 'address[country]')
        first('input[type=submit]').click
        expect(Address.count).to eq(1)
      end
    end
  end

  context 'when shipping' do
    let(:shipping) { user.addresses.create(attributes_for(:address, address_type: 1)) }

    it 'shipping address exists' do
      shipping
      visit settings_addresses_path
      expect(page).to have_field 'address[first_name]', with: shipping.first_name
    end

    it 'valid input' do
      within '#shipping' do
        fill_in('address[first_name]', with: shipping_params[:first_name])
        fill_in('address[last_name]', with: shipping_params[:last_name])
        fill_in('address[address]', with: shipping_params[:address])
        fill_in('address[city]', with: shipping_params[:city])
        fill_in('address[zip]', with: shipping_params[:zip])
        fill_in('address[phone_number]', with: shipping_params[:phone_number])
        select(shipping_params[:country], from: 'address[country]')
        first('input[type=submit]').click
        expect(Address.count).to eq(1)
      end
    end
  end
end
