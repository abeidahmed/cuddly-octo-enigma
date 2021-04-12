Rails.application.routes.draw do
  root to: "sessions#new"

  resources :users, only: %i[create]
  resources :sessions, only: %i[new create]
end
