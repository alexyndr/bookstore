# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  get  'settings', to: 'users#edit'

  # resources :addresses, only: %i[edit create update]

  get   'settings/addresses', to: 'addresses#edit'
  post  'settings/addresses', to: 'addresses#create'
  patch 'settings/addresses', to: 'addresses#update'

  # patch 'settings/update_password', to: 'user#update_password'
  # patch 'settings/update_email',    to: 'user#update_email'

  resource :user, only: %i[edit] do
    collection do
      patch 'update_email'
      patch 'update_password'
    end
  end

  resources :books, only: %i[index show]

  resources :order_quantities, only: %i[create update destroy]
end
