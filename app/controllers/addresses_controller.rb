# frozen_string_literal: true

class AddressesController < ApplicationController
  authorize_resource

  before_action :authenticate_user!
  attr_reader :address

  def edit
    @address_shipping = address_form_type(0)
    @address_billing = address_form_type(1)
  end

  def update
    address = current_user.addresses.find_or_initialize_by(address_type: params[:address][:address_type])
    address.update(safe_params)
    @address_shipping = address.address_type.eql?(0) ? address : address_form_type(0)
    @address_billing =  address.address_type.eql?(1) ? address : address_form_type(1)
    render :edit
  end

  private

  def address_form_type(types)
    current_user.addresses.find_or_initialize_by(address_type: types)
  end

  def safe_params
    params.require(:address).permit(:first_name, :last_name, :address,
                                    :country, :city, :zip, :phone_number, :address_type)
  end
end
