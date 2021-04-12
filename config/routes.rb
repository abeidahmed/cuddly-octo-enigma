Rails.application.routes.draw do
  root to: "sessions#new"

  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]
  resources :projects, only: %i[new]
  resources :finders, only: %i[index]
end
