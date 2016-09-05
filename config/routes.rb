Rails.application.routes.draw do

  root 'application#index'

  resources :sessions, path: 'acesso' do 
    collection do 
      delete 'logout'
    end
  end

  get   'profile',  path: 'meu-perfil', to: 'profiles#edit'
  post  'profile',  path: 'meu-perfil', to: 'profiles#update'


  mount Purchase::Engine    => '/compras'
  mount Financial::Engine   => '/financeiro'
  mount Core::Engine        => '/administracao'
  mount External::Engine    => '/externo'

  get 'products', to: 'purchase/products#index'
end
