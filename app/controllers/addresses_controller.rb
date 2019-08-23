# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :authenticate_user!
  attr_reader :address

  def edit
    @address_shipping = address_form_type('ShippingAddress')
    @address_billing = address_form_type('BillingAddress')
  end

  def update
    address = current_user.addresses.find_or_initialize_by(type: params[:address][:type])
    address.update_attributes(safe_params)
    @address_shipping = address.type.eql?('ShippingAddress') ? address : address_form_type('ShippingAddress')
    @address_billing =  address.type.eql?('BillingAddress')  ? address : address_form_type('BillingAddress')
    render :edit
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
