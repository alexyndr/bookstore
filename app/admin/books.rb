# frozen_string_literal: true

ActiveAdmin.register Book do
  decorate_with BookDecorator

  permit_params :title, :price, :category_id, :description, :materials, :depth,
                :height, :width, :publication_year, author_ids: [], covers: []

  config.filters = false

  index do
    selectable_column

    column :covers do |book|
      book.covers.map do |cover|
        image_tag url_for(cover.variant(resize: '50x50').processed)
      end
    end

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
      f.input :covers, as: :file, input_html: { multiple: true }
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

  show do
    attributes_table do
      row :title
      row :description
      row :covers do |book|
        book.covers.map do |cover|
          image_tag url_for(cover)
        end
      end
      row :price
      row :publication_year
      row :materials
      row :height
      row :width
      row :depth
      row :category
      row :authors
      row :created_at
      row :updated_at
    end
    if book.reviews.approved.present?
      panel t('admin.reviews') do
        table_for book.reviews.approved do
          column :title
          column :user
          column :created_at
        end
      end
    end
    active_admin_comments
  end
end
