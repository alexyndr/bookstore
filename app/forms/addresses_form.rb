# frozen_string_literal: true

# class AddressesForm
#   include ActiveModel::Model

#   attr_reader :params

#   def initialize(params)
#     @save = false
#     @params = params
#     @user = User.find(user_id)
#   end

#   def save
#     @save = true
#   end

#   def shipping
#     shipping = @user.addresses.find_or_initialize_by(address_type: 'Shipping')
#     shipping.update_attributes(params_form) if save?
#     @shipping ||= shipping
#   end

#   def billing
#     billing = @user.addresses.find_or_initialize_by(address_type: 'Billing')
#     billing.update_attributes(params_form) if save?
#     @billing ||= billing
#   end

#   private

#   def save?
#     @save
#   end

#   def user_id
#     if params[:user_id]
#       params.fetch(:user_id)
#     else
#       params.fetch(:address).fetch(:user_id)
#     end
#   end

#   def params_form
#     params.require(:address).permit(:first_name, :last_name, :address,
#                                     :country, :city, :zip, :phone_number, :user_id)
#   end
# end
