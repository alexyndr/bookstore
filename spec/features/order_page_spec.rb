# frozen_string_literal: true

require 'rails_helper'

describe 'Order page', type: :feature do
  let(:user) { create(:user) }
  let(:order) { create(:order, status: :completed, compleated_at: Time.now, user: user) }
  let!(:cart_item) { create(:order_item, order: order) }

  before { login_as(user, scope: :user) }

  scenario 'Order page' do
    visit(root_path)

    find('#my_account').click
    find('#my_account').find('.orders').click

    expect(page.current_path).to eq orders_path

    find('#dropdown').click
    find('#dropdown').find('.canceled').click

    expect(page).not_to have_content(order.number)

    find('#dropdown').click
    find('#dropdown').find('.delivered').click

    expect(page).not_to have_content(order.number)

    find('#dropdown').click
    find('#dropdown').find('.in_delivery').click

    expect(page).not_to have_content(order.number)

    find('#dropdown').click
    find('#dropdown').find('.all').click

    expect(page).to have_content(order.number)
  end

end