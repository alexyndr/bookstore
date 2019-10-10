# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookDecorator do
  let(:book) { create(:book, :attach_author).decorate }

  describe '#names_of_authors' do
    let(:book_author) { book.authors.first.name }

    it { expect(book.names_of_authors).to include book_author }
  end

  # describe '#short_description' do
  #   let(:length) { BookDecorator::DESCRIPTION_LENGTH }
  #   let(:book_short_description) { book.description }

  #   it { expect(book_short_description).to include book.short_description }
  # end
end
