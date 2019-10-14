# frozen_string_literal: true

require 'rails_helper'

describe 'Cart page', type: :feature do
  let(:user) { create(:user) }

  before { login_as(user, scope: :user) }

  it 'empty cart' do
    visit cart_path

    expect(page).to have_content I18n.t('cart.sorry')
  end

  context 'when full cart' do
    let(:order) { create(:order, user: user) }
    let!(:cart_item) { create(:order_item, order: order) }
    let(:coupon) { create(:coupon, active: true) }

    before { visit cart_path }

    it 'full cart' do
      expect(page).not_to have_content I18n.t('cart.sorry')
    end

    it 'plus book' do
      find('.fa-plus').click
      expect(find_field('order_item[quantity]').value).to eq '2'
    end

    it 'minus book' do
      4.times { find('.fa-plus').click }
      2.times { find('.fa-minus').click }
      expect(find_field('order_item[quantity]').value).to eq '3'
    end

    it 'click to cover' do
      find('.general-img-wrap-table').find('a').click
      expect(page).to have_content I18n.t('book_pages.reviews')
    end

    it 'click to title' do
      find('.title').click
      expect(page).to have_content I18n.t('book_pages.reviews')
    end

    it 'insert valid coupon' do
      fill_in I18n.t('cart.enter_coupon_code'), with: coupon.code
      click_button I18n.t('cart.apply_coupon')
      expect(page).not_to have_content I18n.t('cart.discount')
    end

    it 'insert invalid coupon' do
      fill_in I18n.t('cart.enter_coupon_code'), with: ''
      click_button I18n.t('cart.apply_coupon')
      expect(page).to have_content I18n.t('cart.discount')
    end

    it 'click checkout' do
      find('.text-center').find('.btn-default').click
      expect(page).to have_current_path checkout_path(:address)
    end

    it 'delete book' do
      find('.general-cart-close').click
      expect(page).to have_content I18n.t('cart.sorry')
    end
  end
end
