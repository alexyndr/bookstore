# frozen_string_literal: true

require 'rails_helper'

describe 'Books page', type: :feature do
  let!(:book) { create(:book, :attach_covers, category_id: category.id) }
  let(:category) { create(:category) }
  let(:author) { create(:author) }
  let(:user_book) { BookAuthor.create author_id: author.id, book_id: book.id }

  before do
    visit(books_path)
  end

  it 'stay on books page' do
    expect(page).to have_current_path books_path
  end

  it 'books page' do
    expect(page).to have_content(I18n.t('book_pages.newest_first'))
  end
end
