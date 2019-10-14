# frozen_string_literal: true

ActiveAdmin.register Category do
  permit_params :title

  config.filters = false

  index do
    selectable_column
    column :title
    actions
  end
end
