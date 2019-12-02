# frozen_string_literal: true

require 'rails_helper'

describe 'Cart page', type: :feature do
  let(:user) { create(:user) }
  let(:order) { create(:order, user: user) }
  let(:coupon) { create(:coupon, active: true) }
  let(:wrong_code) { '2222' }

  new_cart = CartPageObject.new

  it 'empty cart' do
    new_cart.visit_page

    expect(page).to have_content I18n.t('cart.sorry')
  end

  context 'when one book in cart' do
    let(:book) { create(:book, price: 150) }
    let!(:cart_item) { create(:order_item, book: book, order: order) }

    before { new_cart.login(user).visit_page }

    it 'full cart' do
      expect(page).not_to have_content I18n.t('cart.sorry')
    end

    it 'plus book' do
      new_cart.plus_one_book
      expect(new_cart.book_quantity.value).to eq '2'
    end

    it 'minus book' do
      new_cart.plus_one_book(3)
      new_cart.minus_one_book
      expect(new_cart.book_quantity.value).to eq '3'
    end

    it 'click to cover' do
      new_cart.book_cover.click
      expect(new_cart).to have_content I18n.t('book_pages.reviews')
    end

    it 'click to title' do
      new_cart.book_title.click
      expect(new_cart).to have_content I18n.t('book_pages.reviews')
    end

    it 'insert valid coupon' do
      new_cart.apply_coupon(coupon.code)
      expect(new_cart.find_discount.text).to have_content '15.00'
    end

    it 'insert invalid coupon' do
      new_cart.apply_coupon(wrong_code)
      expect(new_cart).to have_content I18n.t('cart.cart')
      expect(new_cart.find_discount.text).not_to have_content '15.00'
    end

    it 'click checkout' do
      new_cart.checkout_click
      expect(new_cart).to have_current_path checkout_path(:address)
    end

    it 'delete book' do
      new_cart.delete_book_btn.click
      expect(new_cart).to have_content I18n.t('cart.sorry')
    end
  end

  context 'when three books in cart' do
    let!(:cart_items) { create_list(:order_item, 3, order: order) }

    before { new_cart.login(user).visit_page }

    it 'three books in cart' do
      expect(new_cart).to have_css('.general-img-wrap-table', count: 3)
    end

    it 'left only two books' do
      new_cart.delete_book_btn.click
      expect(new_cart).to have_css('.general-img-wrap-table', count: 2)
    end
  end
end
