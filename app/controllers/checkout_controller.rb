class CheckoutController < ApplicationController
  include Wicked::Wizard

  steps :login, :address, :delivery, :payment, :confirm, :complete

  def show
    show_manager

    render_wizard
  end

  def update
    update_manager

    redirect_to next_wizard_path
  end

  private

  def show_manager
    if user_signed_in?
      return jump_to(next_step) if step == :login

      return jump_to(previous_step) unless complete_step?
    end

    @checkout = Checkout::ShowManagerService.new(current_order)
    @checkout.call(step)
  end

  def complete_step?
    Checkout::CompleteService.new(current_order).call(step)
  end

  def update_manager
    Checkout::UpdateManagerService.new(current_order, params).call(step)
  end

  # def update_address
  #   @address_billing = billing_address
  #   @address_shipping = shipping_address
  # end

  # def billing_address
  #   current_order.billing_address ||= current_order.user.try(:billing_address) || Address.new
  # end

  # def shipping_address
  #   current_order.shipping_address ||= current_order.user.try(:shipping_address) || Address.new
  # end
end
