# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :clubs do
    get 'dashboard' => 'dashboard#show'

    resources :members do
      resources :payments
    end

    resources :groups
    resources :tags
    resources :users

    resources :payments do
      get 'send_receipt'
    end

    resources :payment_reasons

    resources :expenses do
      get 'send_receipt'
    end

    resources :expense_reasons
    resources :events
    resources :presences, only: [:index]
    get 'check_presence' => 'presences#check'
  end

  get 'up' => 'rails/health#show', as: :rails_health_check

  mount MissionControl::Jobs::Engine, at: '/jobs'
  mount Yabeda::Prometheus::Exporter => '/metrics'
end
