# frozen_string_literal: true

require 'rails_helper'

describe 'Comments book page', type: :feature do
  let!(:book) { create(:book, :attach_covers) }
  let!(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
    visit book_path(book)
  end

  it 'send comment with invalid fields' do
    click_on('Post')
    expect(page).to have_content("Title can't be blank, Text can't be blank, Score can't be blank, Score is not a number")
  end

  it 'send comment with valid fields' do
    fill_in 'review[title]', with: 'test title'
    fill_in 'review[text]', with: 'test text'
    choose('review[score]', option: 1)
    click_on('Post')
    expect(page).to have_content('Thanks for Review. It will be published as soon as Admin will approve it.')
  end
end
