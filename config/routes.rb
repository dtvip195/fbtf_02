Rails.application.routes.draw do
  root "static_pages#home"

  get "/index", to: "travellings#index"
  get "/show", to: "travellings#show"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  namespace :admin do
    root "static_pages#show"
    get "/locations", to: "locations#index"
    post "/locations", to: "locations#create"
    resources :users
    resources :locations
    resources :travellings
    resources :tours
    resources :bookings, only: %i(update index)
    resources :user, only: %i(index destroy show)
  end
  resources :users
  resources :travellings
  resources :tours
  resources :reviews

  delete "/unlike", to: "likes#destroy"
  resources :likes

  delete "/delete", to: "bookings#destroy"
  delete "/unlike", to: "likes#destroy"
  resources :likes
  resources :bookings
end
