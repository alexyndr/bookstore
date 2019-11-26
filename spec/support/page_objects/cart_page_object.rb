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

  def plus_one_book
    find('.fa-plus').click
  end

  def minus_one_book
    find('.fa-minus').click
  end

  def click_cover
    find('.general-img-wrap-table').find('a').click
  end

  def click_title
    find('.title').click
  end

  def insert_coupon(coupon_code)
    fill_in I18n.t('cart.enter_coupon_code'), with: coupon_code

    self
  end

  def apply_coupon
    click_button I18n.t('cart.apply_coupon')
  end

  def checkout_click
    find('.text-center').find('.btn-default').click
  end

  def delete_book
    find('.general-cart-close').click
  end
end