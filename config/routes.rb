Rails.application.routes.draw do
  get "/" => "home#index",as: :root
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  get "/edit" => "users#edit", as: :edit
  get "/profile" => "users#profile", as: :profile_user
  delete "/change_password" => "users#update_password", as: :change_password


  resources :addresses
  resources :menu_categories
  patch "/upate_activatemenu/:id" => "menu_categories#active_update", as: :activate_menu
  resources :menu_items
  patch "/upate_activateitem/:id" => "menu_items#active_update", as: :activate_item
  resources :cart_items
  delete "/cart_items" => "cart_items#destroy_all", as: :cart_deleteitems
  get "/deleteordered" => "cart_items#deleteordered_all", as: :cart_deleteordereditems

  resources :orders
  patch "/complete_order/:id" => "orders#complete_order", as: :complete_order
  patch "/cancel_order" => "orders#cancel_order", as: :cancel_order

  #order_items
  get "/create" => "order_items#create", as: :order_items

  #sessions
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session

  #admin
  get "/adminmenus" => "admins#menu", as: :admin_menu
  get "/adminmenuitems" => "admins#menu_item", as: :admin_menu_items
  get "/show_all_users" => "admins#show_all_users", as: :show_all_users
  get "/admins" => "admins#index", as: :admins
  get "/search_by_date" => "admins#date_search", as: :search_by_date
  get "/search_by_order" => "admins#order_search", as: :search_by_order
  get "/search_by_lists" => "admins#list_search", as: :search_by_lists
end
