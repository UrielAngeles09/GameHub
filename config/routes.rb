Rails.application.routes.draw do
  resources :games, only: [:show, :index]
  get "games/:id/details", to: "games#details", as: "game_details" 

  get "gamehub/index"
  resource :session
  resources :passwords, param: :token

  get "up" => "rails/health#show", as: :rails_health_check

  root "gamehub#index"

  get "home", to: "gamehub#home"
  get "dashboard", to: "gamehub#dashboard"
end
