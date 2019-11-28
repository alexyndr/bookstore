# frozen_string_literal: true

require 'rails_helper'

describe 'Cart page', type: :feature do
  let(:user) { create(:user) }

  new_cart = CartPageObject.new

  it 'empty cart' do
    new_cart.visit_page

    expect(page).to have_content I18n.t('cart.sorry')
  end

  context 'when full cart' do
    let(:order) { create(:order, user: user) }
    let!(:cart_item) { create(:order_item, order: order) }
    let(:coupon) { create(:coupon, active: true) }
    let(:wrong_code) { '2222' }

    before { new_cart.login(user).visit_page }

    it 'full cart' do
      expect(page).not_to have_content I18n.t('cart.sorry')
    end

    it 'plus book' do
      3.times { new_cart.plus_one_book }
      expect(find_field('order_item[quantity]').value).to eq '4'
    end

    it 'minus book' do
      3.times { new_cart.plus_one_book }
      new_cart.minus_one_book
      expect(find_field('order_item[quantity]').value).to eq '3'
    end

    it 'click to cover' do
      new_cart.click_cover
      expect(page).to have_content I18n.t('book_pages.reviews')
    end

    it 'click to title' do
      new_cart.click_title
      expect(page).to have_content I18n.t('book_pages.reviews')
    end

    it 'insert valid coupon' do
      new_cart.insert_coupon(coupon.code).apply_coupon
      expect(page).not_to have_content I18n.t('cart.discount')
    end

    it 'insert invalid coupon' do
      new_cart.insert_coupon(wrong_code).apply_coupon
      expect(page).to have_content I18n.t('cart.discount')
    end

    it 'click checkout' do
      new_cart.checkout_click
      expect(page).to have_current_path checkout_path(:address)
    end

    it 'delete book' do
      new_cart.delete_book
      expect(page).to have_content I18n.t('cart.sorry')
    end
  end
end
