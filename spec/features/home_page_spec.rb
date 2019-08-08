# frozen_string_literal: true

require 'rails_helper'

describe 'Home page', type: :feature do
  let!(:book) { create(:book, category_id: category.id) }
  let(:category) { create(:category) }
  let(:author) { create(:author) }
  let(:user_book) { BookAuthor.create author_id: author.id, book_id: book.id }

  before do
    visit(root_path)
  end

  it 'stay on home page' do
    expect(page).to have_current_path root_path
  end

  it 'home page' do
    expect(page).to have_content('Welcome to our amazing Bookstore!')
  end
end
