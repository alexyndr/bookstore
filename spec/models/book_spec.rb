# frozen_string_literal: true

RSpec.describe Book, type: :model do
  context 'with db colums' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:string) }
  end
end
