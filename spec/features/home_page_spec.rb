# frozen_string_literal: true

require 'rails_helper'

describe 'Home page', type: :feature do
  let!(:book) { Book.create description: 'dsdsdsds', title: 'FFF' }
  let!(:author) { Author.create name: 'Alex' }
  let(:db) { BookAuthor.create author_id: author.id, book_id: book.id }

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
