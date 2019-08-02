# frozen_string_literal: true

# Home controller
class HomeController < ApplicationController
  def index
    @book = Book.all.sample
  end
end
