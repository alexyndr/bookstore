# frozen_string_literal: true

class UsersController < ApplicationController
  before_filter :authenticate_user!
end
