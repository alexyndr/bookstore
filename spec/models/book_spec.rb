# frozen_string_literal: true

RSpec.describe Book, type: :model do
  subject(:book) { build(:book) }

  context 'with db columns' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:string) }
  end

  it 'applies a by_category scope to collections books by category' do
    book = create(:book)
    expect(described_class.by_category(book.category.id)).to eq([book])
  end

  it { is_expected.to belong_to(:category) }
  it { is_expected.to have_many(:authors) }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :price }

  it { is_expected.to validate_uniqueness_of :title }

  it { is_expected.to validate_numericality_of(:price) }
  it { is_expected.to validate_numericality_of(:height) }
  it { is_expected.to validate_numericality_of(:width) }
  it { is_expected.to validate_numericality_of(:depth) }
end
