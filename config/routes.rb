Rails.application.routes.draw do
  namespace :end_user do
    get 'cart_items/order_check'
    get 'cart_items/confirmation'
    get 'products/search'
    resources :orders
    resources :products, only: [:show] do
      resources :cart_items, only: [:create]
    end
    resources :cart_items, only: [:index, :destroy, :edit, :new]
    # current_userが持っているcartの一括削除
    delete 'cart_items' => 'cart_items#destroy_all', as: 'd_all_cart_item'
    resources :end_users, only: [:show, :edit, :update, :destroy]
    resources :products, only: [:show]
    root to: 'end_users#top'
  end
  namespace :admin do
    get 'products/search'
    resources :orders
    resources :products do
      resources :arrivals
    end
    resources :end_users
    root to: 'arrivals#top'
  end
  get 'end_users/show'
  get 'end_users/edit'
  get 'end_users/top'
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
  # 下の部分もnamespaceにする
  resources :songs
  resources :discs
  resources :labels
  resources :artists
  resources :addresses
  resources :genres
  resources :order_details
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
