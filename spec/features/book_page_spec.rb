# frozen_string_literal: true

require 'rails_helper'

describe 'Book page', type: :feature do
  let!(:book) { create(:book, :attach_covers) }
  let!(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
    visit(book_path(book.id))
  end

  it 'Add to cart' do
    click_button('Add to Cart')
    expect(find('.hidden-xs .shop-quantity').text).to eq('1')
  end

  it 'stay on book page' do
    expect(page).to have_current_path book_path(book.id)
  end

  it 'book page' do
    expect(page).to have_content('Description')
  end

  it 'write a review' do
    page.choose(id: 'review_score_3')
    fill_in I18n.t('book_pages.title'), with: I18n.t('book_pages.title')
    fill_in I18n.t('book_pages.review'), with: I18n.t('book_pages.review')
    click_button I18n.t('book_pages.post')

    expect(page).to have_content 'Thanks for Review'
  end

  it 'send comment with invalid fields' do
    click_on('Post')
    expect(page).to have_content("Title can't be blank, Text can't be blank, Score can't be blank, Score is not a number")
  end
end
