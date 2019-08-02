# frozen_string_literal: true

RSpec.describe BookAuthor, type: :model do
  context 'with db colums' do
    it { is_expected.to have_db_column(:author_id).of_type(:integer) }
    it { is_expected.to have_db_column(:book_id).of_type(:integer) }
  end
end
