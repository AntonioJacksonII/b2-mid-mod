Rails.application.routes.draw do
  get '/studios', to: 'studios#index'
  get '/movies/:movie_id', to: 'movies#show'
  post '/movies/:movie_id/actors', to: 'actors#create'

  get '/actors/:actor_id', to: 'actors#show'
end
