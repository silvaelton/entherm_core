Purchase::Engine.routes.draw do
  root 'dashboard#index'

  resources :orders do 
    get 'fpa'
  end
  
  resources :requests
  resources :products


end
