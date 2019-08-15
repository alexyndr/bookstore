# frozen_string_literal: true

# This class must doo...
class Book < ApplicationRecord
  belongs_to :category
  has_many :book_authors, dependent: :destroy
  has_many :order_quantities
  has_many :authors, through: :book_authors, dependent: :destroy

  scope :by_category, ->(category_id) { where category_id: category_id }
  # by_category { where(category_id) }

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true
  validates :height, :width, :depth, numericality: true
end
