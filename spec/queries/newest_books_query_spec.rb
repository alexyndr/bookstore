# frozen_string_literal: true

describe NewestBooksQuery do
  let!(:books) { create_list(:book, 10) }

  it 'expect collection of 3 latest books' do
    expect(described_class.call).to match_array(books.last(3))
  end
end
