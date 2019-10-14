# frozen_string_literal: true

class AddressesController < ApplicationController
  authorize_resource

  before_action :set_addresses

  def edit; end

  def update
    @address_billing.update(safe_params) if params_address == 'billing'
    @address_shipping.update(safe_params) if params_address == 'shipping'
    current_user.save
    render :edit
  end

  private

  def params_address
    params[:address][:address_type] unless params[:address].nil?
  end

  def set_addresses
    @address_billing = set_address_billing
    @address_shipping = set_address_shipping
  end

  def set_address_billing
    return current_user.build_billing_address if params_address == 'billing'

    current_user.billing_address || Address.new
  end

  def set_address_shipping
    return current_user.build_shipping_address if params_address == 'shipping'

    current_user.shipping_address || Address.new
  end

  def safe_params
    params.require(:address).permit(:first_name, :last_name, :address,
                                    :country, :city, :zip, :phone_number)
  end
end
