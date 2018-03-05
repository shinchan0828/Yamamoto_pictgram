Rails.application.routes.draw do

  get 'comments/index'

  get 'favorites/index'

  get 'topics/new'

  root 'pages#index'    
  
  get 'pages/help'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources 'users'
  resources 'topics'
  
  post '/favorites', to: 'favorites#create'
  get '/favorites', to: 'favorites#index'
  
  get 'comments/new', to: 'comments#new'
  post '/comments', to: 'comments#create'
end
