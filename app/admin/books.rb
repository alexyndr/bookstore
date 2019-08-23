# frozen_string_literal: true

ActiveAdmin.register Book do
  decorate_with BookDecorator

  permit_params :title, :price, :category_id, :cover, :description, :materials, :depth,
                :height, :width, :publication_year, author_ids: []

  config.filters = false

  index do
    selectable_column

    column :cover

    column :title

    column :authors, &:names_of_authors

    column :description, &:short_description

    column :category

    column :price

    actions
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :title
      f.input :cover
      f.input :description, as: :text
      f.input :price
      f.input :publication_year
      f.input :materials
      f.input :height
      f.input :width
      f.input :depth
      f.input :category
      f.input :authors, as: :check_boxes, collection: Author.all.map { |author| [author.name, author.id] }
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
