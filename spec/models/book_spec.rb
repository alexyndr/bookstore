# frozen_string_literal: true

RSpec.describe Book, type: :model do
  let(:book) { build(:book, :attach_covers) }

  context 'with db columns' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:string) }
    it { is_expected.to have_db_column(:price).of_type(:decimal) }
    it { is_expected.to have_db_column(:height).of_type(:decimal) }
    it { is_expected.to have_db_column(:width).of_type(:decimal) }
    it { is_expected.to have_db_column(:depth).of_type(:decimal) }
  end

  describe 'scope' do
    it 'bu category id' do
      expect(Book.by_category(1)).to eq Book.where(category_id: 1)
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:book_authors).dependent(:destroy) }
    it { is_expected.to have_many(:authors).through(:book_authors) }
    it { is_expected.to have_many(:reviews).dependent(:destroy) }
    it { is_expected.to have_many(:order_items) }
    it { is_expected.to belong_to(:category) }
  end

  # it 'applies a by_category scope to collections books by category' do
  #   book = create(:book)
  #   expect(described_class.by_category(book.category.id)).to eq([book])
  # end

  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_uniqueness_of :title }
    it { is_expected.to validate_numericality_of(:price) }
    it { is_expected.to validate_numericality_of(:height) }
    it { is_expected.to validate_numericality_of(:width) }
    it { is_expected.to validate_numericality_of(:depth) }
  end

  describe 'attachment' do
    it '#covers' do
      expect(book.covers).to be_attached
    end
  end
end
