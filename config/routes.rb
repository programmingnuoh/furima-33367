Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :delivers, only: [:index, :create]
    resources :order_items, only: [:index]
  end
end
