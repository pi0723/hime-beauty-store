Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions'
  }

  devise_for :admins
  root to: 'products#index'
  resources :products, only: [:index, :show]

  namespace :admin do
    root to: 'admin/products#index'
    resources :products
  end

  resources :carts, only: [:index] do
    collection do
      post :add
    end
    member do
      resources :cart_items, only: [:update, :destroy]
    end
  end

  resources :orders, only: [:new, :create]

end
