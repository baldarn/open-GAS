# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  resources :clubs do
    resources :members do
      resources :payments
    end

    resources :events
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
