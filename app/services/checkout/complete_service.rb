class Checkout::CompleteService
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
    @order.user
  end

  def delivery
    @order.billing_address && @order.shipping_address
  end

  def payment
    @order.delivery
  end

  def confirm
    @order.card
  end

  def complete
    @order.completed?
  end
end