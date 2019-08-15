# frozen_string_literal: true

describe SorterBooksQuery do
  let(:query) { described_class.new(Book.all, params) }
  let(:params) { { sort: 'created_at', category_id: category.id, direction: 'desc' } }
  let(:category) { create(:category) }
  let(:other_category) { create(:category) }

  it 'returns books filter by category' do
    create(:book, category: other_category)
    book = create(:book, category: category)

    expect(query.call).to match_array([book])
  end

  it 'returns books order by sort params' do
    first_book = create(:book, category: category)
    second_book = create(:book, category: category)

    expect(query.call).to eq([second_book, first_book])
  end
end
