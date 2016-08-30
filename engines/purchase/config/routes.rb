Purchase::Engine.routes.draw do
  root 'dashboard#index'

  resources :orders
  resources :requests
  resources :products


end
