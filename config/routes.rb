Rails.application.routes.draw do

  root 'application#index'

  mount Purchase::Engine    => '/compras'
  mount Financial::Engine   => '/financeiro'
end
