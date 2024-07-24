# frozen_string_literal: true

require 'resque/server'
require 'resque-scheduler'
require 'resque/scheduler/server'

Rails.application.routes.draw do
  root to: 'home#index'

  resources :clubs do
    resources :members do
      resources :payments
    end

    resources :events
  end

  mount Resque::Server.new, at: '/resque'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
