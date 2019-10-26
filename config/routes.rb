Rails.application.routes.draw do
  namespace :end_user do
    get 'cart_items/order_check'
    get 'cart_items/confirmation'
    resources :orders, only: [:index, :new, :create]
    resources :products, only: [:show] do
      resources :cart_items, only: [:create]
    end
    resources :cart_items, only: [:index, :destroy, :edit, :new]
    # current_userが持っているcartの一括削除
    delete 'cart_items' => 'cart_items#destroy_all', as: 'd_all_cart_item'
    resources :end_users, only: [:edit, :update, :destroy]
    resources :end_users, only: [:show] do
      get 'end_users/leave'
    end
    resources :products, only: [:show]
    root to: 'end_users#top'
  end
  namespace :admin do
    resources :orders, only: [:show, :edit, :update, :index]
    resources :genres, only: [:index, :new, :create, :destroy]
    resources :labels, only: [:index, :new, :create, :destroy]
    resources :artists, only: [:index, :new, :create, :destroy]
    resources :products do
      resources :arrivals, only: [:top, :index, :create, :destroy, :new]
      get :autocomplete_artist_artist_name, on: :collection # 追加
    end

    resources :end_users, only: [:show, :edit, :update, :destroy, :top, :index]
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
# namespaceの振り分け必要！
  resources :songs
  resources :discs
  resources :addresses
  resources :order_details
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
