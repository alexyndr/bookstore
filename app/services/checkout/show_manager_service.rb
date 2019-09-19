class Checkout::ShowManagerService
  attr_reader :address_billing, :address_shipping

  def initialize(order)
    @order = order
  end

  def call(step)
    case step
    when :address then address
    when :delivery then delivery
    when :payment then payment
    when :confirm then confirm
    when :complete then complete
    end
  end

  def address
    @address_billing = set_billing_address
    @address_shipping = set_shipping_address
    @order&.coupon&.update(active: false) # if @order.coupon
  end

  def delivery
  end

  def set_billing_address
    @order.billing_address ||= @order.user.try(:billing_address) || Address.new
  end

  def set_shipping_address
    @order.shipping_address ||= @order.user.try(:shipping_address) || Address.new
  end
end