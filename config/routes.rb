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
  delete "/cart_items" => "cart_items#destroy_all", as: :cart_deleteitems
  get "/deleteordered" => "cart_items#deleteordered_all", as: :cart_deleteordereditems

  resources :orders

  #order_items
  get "/create" => "order_items#create", as: :order_items

  #sessions
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session
end
