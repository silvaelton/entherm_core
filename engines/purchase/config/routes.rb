Purchase::Engine.routes.draw do
  root 'dashboard#index'

  resources :orders do 
    get 'fpa'
  end
  
  resources :requests do 
    get 'cancel'
    get 'processing'
    get 'finish'
  end

  resources :products
  resources :order_categories
  resources :suppliers
  resources :supplier_categories
  resources :stocks
  resources :patrimonies

  resources :searches
  resources :reports 

end
