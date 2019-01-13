Rails.application.routes.draw do
  resources :customer_orders
  resources :products, only: [:index]


  root 'products#index'
end
