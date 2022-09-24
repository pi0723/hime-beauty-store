Rails.application.routes.draw do
  
  devise_for :users
  devise_for :admins
  root to: 'products#index'
  resources :products, only: [:index, :show]

  namespace :admin do
    root to: 'admin/products#index'
    resources :products
  end

  resources :carts, only: [:show] do
    collection do
      post :add
    end
    member do
      resources :cart_items, only: %i[update destroy]
    end
  end

end
