# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'

  get 'up' => 'rails/health#show', as: :rails_health_check
end
