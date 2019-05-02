Rails.application.routes.draw do
  root "static_pages#home"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  get "/search", to: "static_pages#search"
  get "/index", to: "travellings#index"
  get "/show", to: "travellings#show"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: :show
  resources :travellings
  resources :tours

  delete "/delete_review", to: "reviews#destroy"
  resources :reviews, only: %i(create edit update)

  delete "/delete", to: "comments#destroy"
  resources :comments, only: %i(new create)

  post "/like", to: "likes#create"
  delete "/unlike", to: "likes#destroy"

  resources :bookings, only: [:new, :create]
  delete "/delete", to: "bookings#destroy"

  namespace :admin do
    root "static_pages#show"
    resources :users, only: %i(index destroy show)
    get "/locations", to: "locations#index"
    post "/locations", to: "locations#create"
    resources :locations, except: %i(show index create)
    resources :travellings, except: :show
    resources :tours, except: :show
    resources :bookings, only: %i(index update)
  end
end
