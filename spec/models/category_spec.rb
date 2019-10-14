# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'with db colums' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:books).dependent(:destroy) }
  end
end
