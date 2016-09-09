Financial::Engine.routes.draw do
  root 'dashboard#index'

  resources :bill_categories, path: 'categorias'
  resources :bills,           path: 'contas'
  resources :vincibles,       path: 'venciveis'
  resources :cash_registers,  path: 'caixa'

end
