# frozen_string_literal: true

# This class must doo...
class Book < ApplicationRecord
  # has_rich_text :description

  belongs_to :category
  has_many :book_authors, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :order_items
  has_many :authors, through: :book_authors, dependent: :destroy

  has_many_attached :covers

  scope :by_category, ->(category_id) { where category_id: category_id }

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true
  validates :height, :width, :depth, numericality: true

  validates :covers, content_type: { in: %i[png jpg jpeg], message: 'File is not a PNG, JPG, JPEG' },
                     size: { less_than: 1.megabytes, message: 'File must be less than 1 mb' }
end
