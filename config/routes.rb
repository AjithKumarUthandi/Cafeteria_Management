Rails.application.routes.draw do
  get "/" => "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  get "/edit" => "users#edit", as: :edit
  get "/profile" => "users#profile", as: :profile_user

  resources :addresses
  resources :menu_categories
  resources :menu_items
  resources :cart_items
  delete "/cart_items" => "cart_items#destroy_all", as: :cart_item_path

  resources :orders
  resources :order_items

  #sessions
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session
end
