Rails.application.routes.draw do
  # resources :dogs
  # resources :breeds
  # resources :users

  #homepage --> redirects to user showpage if already logged in
  root 'sessions#new', as: 'sign_in'
  
  post '/login', to: 'sessions#create', as: 'log_in'
  delete '/logout', to: 'sessions#destroy', as: 'log_out'
  
  #users routes
  get '/users', to: 'users#index', as: 'users'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  get '/users/:id', to: 'users#show', as: 'user'
  patch '/users/:id', to: 'users#update', as: 'update_user'
  delete '/users/:id', to: 'users#destroy', as: 'delete_user'

  #breeds routes
  get '/breeds', to: 'breeds#index', as: 'breeds'
  get '/breeds/new', to: 'breeds#new', as: 'new_breed'
  post '/breeds', to: 'breeds#create'
  get '/breeds/:id/edit', to: 'breeds#edit', as: 'edit_breed'
  patch '/breeds/:id', to: 'breeds#update'
  get '/breeds/:id', to: 'breeds#show', as: 'breed'
  delete '/breeds/:id', to: 'breeds#destroy', as: 'delete_breed'

  #dogs routes
  get '/dogs', to: 'dogs#index', as: 'dogs'
  get 'dogs/new', to: 'dogs#new', as: 'new_dog'
  post '/dogs', to: 'dogs#create'
  get 'dogs/:id/edit', to: 'dogs#edit', as: 'edit_dog'
  patch 'dogs/:id', to: 'dogs#update'
  get '/dogs/:id', to: 'dogs#show', as: 'dog'
  delete '/dogs/:id', to: 'dogs#destroy', as: 'delete_dog'

end
