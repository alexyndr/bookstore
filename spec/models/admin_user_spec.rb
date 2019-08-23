# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  context 'with db column' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
  end
end
