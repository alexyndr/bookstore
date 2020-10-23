class CartPageObject
  include Capybara::DSL
  include Rails.application.routes.url_helpers
  include FactoryBot::Syntax::Methods
  include Warden::Test::Helpers

  def login(user)
    login_as(user, scope: :user)

    self
  end

  def visit_page
    visit cart_path
  end

  def plus_one_book(count = 1)
    count.times { find('.fa-plus').click }
  end

  def minus_one_book(count = 1)
    count.times { find('.fa-minus').click }
  end

  def book_cover
    find('.general-img-wrap-table').find('a')
  end

  def book_title
    find('.title')
  end

  def book_quantity
    find_field('order_item[quantity]')
  end

  def find_discount
    find('.discount')
  end

  def apply_coupon(coupon_code)
    fill_in I18n.t('cart.enter_coupon_code'), with: coupon_code
    click_button I18n.t('cart.apply_coupon')
  end

  def checkout_click
    find('.text-center').find('.btn-default').click
  end

  def delete_book_btn
    first('.delete-order-item')
  end
end
