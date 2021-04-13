Rails.application.routes.draw do
  root to: "home#index"

  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
  delete "/signout", to: "sessions#destroy", as: :signout

  resources :projects, only: %i[new create show] do
    resources :articles, only: %i[index create]
    resources :searches, only: %i[index]
  end
end
