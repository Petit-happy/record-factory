Rails.application.routes.draw do
  namespace :admin do
    resources :orders
    resources :products
    resources :end_users
  end
  namespace :end_user do
    resources :orders
    resources :products
    resources :end_users
  end
  resources :songs
  resources :discs
  resources :labels
  resources :artists
  resources :addresses
  resources :genres
  resources :arrivals
  # resources :products
  resources :order_details
  resources :cart_items
  # resources :orders
  # resources :end_users
  devise_for :admin_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
