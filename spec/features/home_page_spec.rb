# frozen_string_literal: true

require 'rails_helper'

describe 'Home page', type: :feature do
  let!(:book) { Book.create description: 'dsdsdsds', title: 'FFF', category_id: category.id }
  let!(:author) { Author.create name: 'Alex' }
  let(:user_book) { BookAuthor.create author_id: author.id, book_id: book.id }
  let(:category) { Category.create title: 'Title' }

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
