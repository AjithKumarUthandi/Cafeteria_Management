Rails.application.routes.draw do
  get "/" => "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :addresses
  resources :menu_categories
  resources :menu_items
  post "users/login", to: "users#login"

  #sessions
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session
end
