# frozen_string_literal: true

class Checkout::UpdateManagerService
  def initialize(order, params)
    @order = order
    @params = params
  end

  def call(step)
    case step
    when :address then address
    when :delivery then delivery
    when :payment then payment
    when :confirm then confirm
    end
  end

  def address
    @address_billing = @order.create_billing_address(address_params('billing'))
    if use_billing
      @address_shipping = @address_billing
    else
      @address_shipping = @order.create_shipping_address(address_params('shipping'))
    end
    @order.save
  end

  private

  def address_params(type)
    @params.fetch(:address).require(type.to_s).permit(:first_name, :last_name, :address,
                                                      :country, :city, :zip, :phone_number, :use_billing)
  end

  def use_billing
    @params[:use_billing]
  end
end
