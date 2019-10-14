# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user, session = nil)
    user ||= User.new # guest user (not logged in)
    if user.is_a? Admin
      can :manage, :all
    elsif user.is_a?(User) && user.persisted?
      can :read, [Author, Book, Category, Coupon, Review]
      can :create, Review, user_id: user.id
      can %i[read create update], [Address], user_id: user.id
      can %i[create update destroy], OrderItem, order_id: session[:current_order_id]
      can :create, Order
      can :update, Order, id: session[:current_order_id]
      can :manage, User, user_id: user.id
    else
      can :read, [Author, Book, Category, Review]
      can %i[create update destroy], OrderItem, order_id: session[:current_order_id]
      can :create, Order
      can :update, Order, id: session[:current_order_id]
    end
  end
end
