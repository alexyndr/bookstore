# frozen_string_literal: true

require 'rails_helper'

describe 'Book page', type: :feature do
  let!(:book) { create(:book, category_id: category.id) }
  let(:category) { create(:category) }
  let(:author) { create(:author) }
  let(:user_book) { BookAuthor.create author_id: author.id, book_id: book.id }

  before do
    visit(book_path(book.id))
  end

  it 'stay on book page' do
    expect(page).to have_current_path book_path(book.id)
  end

  it 'book page' do
    expect(page).to have_content('Description')
  end
end
