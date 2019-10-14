# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  # delegate :id, :authors, :title, :category, :cover, :price, :description
  delegate_all

  DESCRIPTION_LENGTH = 80

  def names_of_authors
    authors.map(&:name).join(', ')
  end

  def short_description
    description.first(DESCRIPTION_LENGTH) + ' ...'
  end
end
