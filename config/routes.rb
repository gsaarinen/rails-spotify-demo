Rails.application.routes.draw do

  root 'home#index'

  get '/artists/',                to: 'artists#index'
  get '/artists/:id',             to: 'artists#show', as: 'artist'


  get '/auth/:provider/callback', to: 'sessions#create' #'users#spotify'


  get '/user/:id',                to: 'users#show'

  delete '/logout',                to: "sessions#destroy", as: 'sign_out'

  resources :users

end
