Rails.application.routes.draw do
  namespace :end_user do
    get 'end_users/top'
    get 'orders/order_check'
    get 'orders/confirmation'
    get 'products/search'
    resources :orders
    resources :products
    resources :end_users, only: [:show, :edit, :update, :destroy]
    root to: 'end_users#top'
  end
  namespace :admin do
    get 'products/search'
    resources :orders
    resources :products
    resources :end_users
    root to: 'end_users#top'
  end
  get 'end_users/show'
  get 'end_users/edit'
  get 'end_users/top'
  # devise_for :admin_users
  # devise_for :end_users
  devise_for :admin_users, controllers: {
    sessions:      'admin_users/sessions',
    passwords:     'admin_users/passwords',
    registrations: 'admin_users/registrations'
  }
  devise_for :end_users, controllers: {
    sessions:      'end_users/sessions',
    passwords:     'end_users/passwords',
    registrations: 'end_users/registrations'
  }
  resources :songs
  resources :discs
  resources :labels
  resources :artists
  resources :addresses
  resources :genres
  resources :arrivals
  resources :order_details
  resources :cart_items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get 'admin' => 'arrivals#top'


end
