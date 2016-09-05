Rails.application.routes.draw do

  root 'application#index'

  mount Purchase::Engine    => '/compras'
  mount Financial::Engine   => '/financeiro'
  mount Core::Engine        => '/administracao'
  mount External::Engine    => '/externo'

  get 'products', to: 'purchase/products#index'
end
