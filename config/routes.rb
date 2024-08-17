# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :clubs do
    get 'dashboard' => 'dashboard#show'

    get 'members/dashboard' => 'members#dashboard'

    resources :members do
      resources :payments
    end

    resources :groups
    resources :tags
    resources :users

    resources :payments
    resources :expenses
    resources :events do
      resources :presences
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
