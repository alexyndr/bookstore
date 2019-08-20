# frozen_string_literal: true

class AddressesController < ApplicationController
  def edit
    @address_shipping = address_form_type('ShippingAddress')
    @address_billing = address_form_type('BillingAddress')
  end

  def update
    @address = current_user.addresses.find_or_initialize_by(type: params[:address][:type])
    @address.assign_attributes(safe_params)
    @address.save
    redirect_to settings_addresses_path
  end

  private

  def address_form_type(types)
    current_user.addresses.find_or_initialize_by(type: types)
  end

  def safe_params
    params.require(:address).permit(:first_name, :last_name, :address,
                                    :country, :city, :zip, :phone_number, :user_id, :order_id, :type)
  end
end
