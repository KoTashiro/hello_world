Rails.application.routes.draw do
  get '/', to: 'home#top'

  get '/pages', to: 'pages#index'
  post '/pages', to: 'pages#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :posts

end
