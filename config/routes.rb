Rails.application.routes.draw do
  # root to: 'home#index'

  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :movies
  resources :tv_shows
  resources :posters
  get 'trending_movies', to: 'movies#trending_movies'
  get 'trending_tv_shows', to: 'tv_shows#trending_tv_shows'
end