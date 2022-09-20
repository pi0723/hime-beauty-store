Rails.application.routes.draw do
  devise_for :admins
  root to: 'products#index'
  resources :products, only: [:index, :show]
end
