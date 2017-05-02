Rails.application.routes.draw do

  # get 'artists/index'

  # get 'artists/show'

  root 'home#index'

  get '/artists/',    to: 'artists#index'
  get '/artists/:id', to:'artists#show', as: 'artist'
  get '/auth/spotify/callback', to: 'sessions#create' #'users#spotify'

  # I don't think this is right.
  # get '/users/', to: "users#index"

end
