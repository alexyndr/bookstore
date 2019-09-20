# frozen_string_literal: true

class AddressesController < ApplicationController
  authorize_resource

  before_action :authenticate_user!, :set_addresses
  attr_reader :address

  def edit; end

  def update
    if params[:address][:address_type] == 'billing'
      @address_billing.update(safe_params)
      current_user.save
    elsif params[:address][:address_type] == 'shipping'
      @address_shipping.update(safe_params)
      current_user.save
    end
    render :edit
  end

  private

  def set_addresses
    @address_shipping = address_type('shipping_address')
    @address_billing = address_type('billing_address')
  end

  def address_type(type)
    current_user.send(type) || current_user.send("build_#{type}")
  end

  def safe_params
    params.require(:address).permit(:first_name, :last_name, :address,
                                    :country, :city, :zip, :phone_number)
  end
end
