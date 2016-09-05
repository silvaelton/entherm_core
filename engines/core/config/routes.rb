Core::Engine.routes.draw do

  resources :companies,   path: 'empresas'
  resources :contracts,   path: 'contratos'
  resources :requesters,  path: 'solicitantes'
  resources :users,       path: 'usuarios'
  resources :states,      path: 'estados'

end
