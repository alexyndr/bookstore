# frozen_string_literal: true

require 'rails_helper'

describe 'Checkout page', type: :feature do
  let(:email){'safe@safe.com'}
  let!(:book){create(:book)}
  let!(:deliveries){create_list(:delivery, 2)}
  let(:address_params){ attributes_for(:address) }
  let(:card_params){ attributes_for(:card) }

  scenario 'Checkout process' do
    visit(root_path)
    find('.btn-primary').click
    visit(cart_path)
    find('.text-center').find('.btn-default').click

    expect(page).to have_current_path checkout_path(:login)

    within('#new_customer'){ fill_in 'user[email]', with: email }
    click_button I18n.t('checkout.continue_to_checkout')

    expect(page).to have_current_path root_path

    visit(cart_path)
    find('.text-center').find('.btn-default').click

    expect(page).to have_current_path checkout_path(:address)

    within('form#new_address') do
      %w[billing shipping].each do |type|
        fill_in "address[#{type}][first_name]", with: address_params[:first_name]
        fill_in "address[#{type}][last_name]", with: address_params[:last_name]
        fill_in "address[#{type}][address]", with: address_params[:address]
        fill_in "address[#{type}][city]", with: address_params[:city]
        fill_in "address[#{type}][zip]", with: address_params[:zip]
        select(address_params[:country], from: "address[#{type}][country]")
        fill_in "address[#{type}][phone_number]", with: address_params[:phone_number]
      end
      # check('use_billing') # selenium dont see hiden elements
      click_button(I18n.t('checkout.save_and_continue'))
    end

    expect(page.current_path).to eq checkout_path(:delivery)

    all('.radio_label').first.click
    click_button(I18n.t('checkout.save_and_continue'))

    expect(page.current_path).to eq checkout_path(:payment)

    within('form#new_card') do
      fill_in 'card[number]', with: card_params[:number]
      fill_in 'card[card_holder]', with: card_params[:card_holder]
      fill_in 'card[valid_thru]', with: card_params[:valid_thru]
      fill_in 'card[cvv]', with: card_params[:cvv]

      click_button(I18n.t('checkout.save_and_continue'))
    end

    expect(page.current_path).to eq checkout_path(:confirm)

    click_button(I18n.t('checkout.place_order'))

    expect(page.current_path).to eq checkout_path(:complete)
  end

end
