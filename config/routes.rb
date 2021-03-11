# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  get  'settings', to: 'users#edit'
  get  'orders', to: 'orders#index'

#   get   'settings/addresses', to: 'addresses#edit'
#   post  'settings/addresses', to: 'addresses#create'
#   patch 'settings/addresses', to: 'addresses#update'
  resources settings do
    resources addresses, only: %i[create update]
  end
      

  resources :checkout
  resources :order_items, only: %i[create update destroy]

  resource :cart, only: %i[show update]

  resource :user, only: %i[edit] do
    collection do
      patch 'update_email'
      patch 'update_password'
    end
  end

  resources :books, only: %i[index show] do
    resources :reviews, only: :create
  end
end
