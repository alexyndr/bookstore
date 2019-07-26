# frozen_string_literal: true

RSpec.describr Author, type: :model do
  context 'db colums' do
    it { is_expect.to have_db_column(:name).of_type(:string)}
  end
end
