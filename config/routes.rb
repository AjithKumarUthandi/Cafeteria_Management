Rails.application.routes.draw do
  get "/" => "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :addresses
  resources :menu_categories
  resources :menu_items
  # get "all/:id"
end
