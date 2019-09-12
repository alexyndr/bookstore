class CheckoutController < ApplicationController
  include Wicked::Wizard

  steps :login, :address

  def show
    step_checker

    render_wizard
  end

  private

  def step_checker
    if user_signed_in?
      return jump_to(next_step) if step == :login

      # return jump_to(previous_step) unless complete_step?
    end
  end

  # def complete_step?

  # end


end