Rails.application.routes.draw do
  root to: "sessions#new"

  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create]

  resources :projects, only: %i[new create] do
    resources :articles, only: %i[new create]
  end

  resources :finders, only: %i[index]
end
