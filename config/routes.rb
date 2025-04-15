Rails.application.routes.draw do
  # Game resource routes for game_path and index
  resources :games, only: [:show, :index]
  get "games/:id/details", to: "games#details", as: "game_details"

  get "gamehub/index"
  resource :session
  resources :passwords, param: :token

  get "up" => "rails/health#show", as: :rails_health_check

  root "gamehub#index"

  # Home & Dashboard views
  get "home", to: "gamehub#home"
  post "home", to: "gamehub#home"
  get "dashboard", to: "gamehub#dashboard"
end
