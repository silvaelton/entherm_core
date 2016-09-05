External::Engine.routes.draw do

  root 'dashboard#index'
  
  resources :requests, path: 'pedidos' do 
    resources :comments, path: 'comentarios'
  end

  resources :sessions, path: 'acesso' do 
    collection do 
      delete 'logout'
    end
  end

  get   'profile',  path: 'meu-perfil', to: 'profiles#edit'
  post  'profile',  path: 'meu-perfil', to: 'profiles#update'

end
