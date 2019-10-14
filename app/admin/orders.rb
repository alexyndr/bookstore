# frozen_string_literal: true

ActiveAdmin.register Order do
  permit_params :status, :active_admin_requested_event

  after_save do |order|
    event = params[:order][:active_admin_requested_event]
    unless event.blank?
      safe_event = (order.aasm.events(permitted: true).map(&:name) & [event.to_sym]).first
      raise "Forbidden event #{event} requested on instance #{order.id}" unless safe_event

      order.send("#{safe_event}!")
    end
  end

  config.filters = false

  scope :all, default: true
  scope :in_progress
  scope :completed
  scope :in_delivery
  scope :delivered
  scope :canceled

  index do
    selectable_column
    column :number
    state_column :status
    column :user
    column :created_at
    actions defaults: false do |status|
      link_to t('admin.change_status'), edit_admin_order_path(status)
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :status, input_html: { disabled: true }, as: :string, label: 'Current state'

      # use the attr_accessor to pass the data
      f.input :active_admin_requested_event, label: t('admin.change_state'), as: :radio, collection:
        f.object.aasm.events(reject: %i[in_progress completed]).map(&:name)
    end
    f.actions
  end
end
