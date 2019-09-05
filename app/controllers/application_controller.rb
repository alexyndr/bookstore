# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  # def current_ability
  #   @current_ability ||= Ability.new(current_user, session)
  # end
end
