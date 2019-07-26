# frozen_string_literal: true

RSpec.describe Author, type: :model do
  context 'with db colums' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end
end
