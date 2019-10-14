# frozen_string_literal: true

ActiveAdmin.register Review do
  permit_params :status, :active_admin_requested_event

  after_save do |review|
    event = params[:review][:active_admin_requested_event]
    unless event.blank?
      safe_event = (review.aasm.events(permitted: true).map(&:name) & [event.to_sym]).first
      raise "Forbidden event #{event} requested on instance #{review.id}" unless safe_event

      review.send("#{safe_event}!")
    end
  end

  config.filters = false

  scope :all, default: true
  scope :waiting
  scope :approved
  scope :rejected

  index do
    selectable_column
    column :book
    column :title
    column :created_at
    column :user
    state_column :status
    actions defaults: false do |status|
      link_to t('admin.change_status'), edit_admin_review_path(status)
    end
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :title, input_html: { disabled: true }
      f.input :text, input_html: { disabled: true }

      # use the attr_accessor to pass the data
      f.input :active_admin_requested_event, label: t('admin.change_state'), as: :radio, collection:
        f.object.aasm.events(permitted: true).map(&:name)
    end
    f.actions
  end
end
