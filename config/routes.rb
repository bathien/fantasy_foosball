# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dashboards#home'
  resources :matches
  resources :teams
  resources :games
  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
