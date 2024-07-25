# frozen_string_literal: true

require 'resque/server'

Rails.application.routes.draw do
  root to: 'home#index'

  resources :clubs do
    resources :members do
      resources :payments
    end

    resources :payments, only: [:index]
    resources :events
  end

  mount Resque::Server.new, at: '/resque'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
