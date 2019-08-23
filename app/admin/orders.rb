# frozen_string_literal: true

ActiveAdmin.register Order do
  permit_params :status

  config.filters = false

  scope :all
  scope :in_progress
  scope :completed
  scope :in_delivery
  scope :delivered
  scope :canceled

  index do
    selectable_column
    column :number
    column :status
    column :user_id
    column :created_at
    actions defaults: false do |status|
      link_to 'Change status', edit_admin_order_path(status)
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :status, as: :select, collection: Order.statuses.values.map(&:to_s)
    end
    f.actions
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
