Rails.application.routes.draw do

  # ユーザー管理
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions:      'users/sessions'
  }
  resources :users, only: [:show]


  # 管理人用
  devise_for :admins
  namespace :admin do
    root to: 'admin/products#index'
    resources :products
  end


  # トップページ/詳細ページ/お気に入り
  root to: 'products#index'
  resources :products, only: [:index, :show] do
    resources :likes, only: [:create, :destroy]
  end

  
  # カート
  resources :carts, only: [:index] do
    collection do
      post :add
    end
    member do
      resources :cart_items, only: [:update, :destroy]
    end
  end


  # 購入
  resources :orders, only: [:new, :create]

end
