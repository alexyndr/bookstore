# frozen_string_literal: true

class CheckoutController < ApplicationController
  include Wicked::Wizard

  steps :login, :address, :delivery, :payment, :confirm, :complete

  def show
    show_manager

    if current_order.order_items.empty? && step != :complete # || !current_user && step != :login
      redirect_to root_path
    else
      render_wizard
    end

    current_order.completed! if step == :complete && current_order.compleated_at?
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

    @checkout = Checkout::ShowManagerService.new(current_order, current_user)
    @checkout.call(step)
  end

  def complete_step?
    Checkout::CompleteService.new(current_order, current_user).call(step)
  end

  def update_manager
    Checkout::UpdateManagerService.new(current_order, params, session).call(step)
  end
end
