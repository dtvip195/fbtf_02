Rails.application.routes.draw do
  root "static_pages#home"

  get "/index", to: "tours#index"
  get "/tour_details", to: "tours#show"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  namespace :admin do
    root "static_pages#show"
    resources :users
  end
  resources :users
end
