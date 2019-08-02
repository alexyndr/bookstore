# frozen_string_literal: true

class AuthorsController < ApplicationController
  def show
    @author = Authors.find(params[:id])
  end

  def index
    @authors = Authors.all
  end
end
