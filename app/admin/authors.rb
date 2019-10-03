# frozen_string_literal: true

ActiveAdmin.register Author do
  permit_params :name, :description

  config.filters = false

  index do
    selectable_column
    column :name
    column :description
    actions
  end
end
