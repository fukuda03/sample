Rails.application.routes.draw do
  get 'hashtags/new'
  get 'hashtags/hashtag'
  get 'sessions/new'
  get 'users/show'
  get 'users/edit'
  get 'randomtitles/new'
  get 'randomtitles/index'
  get 'comments/new'
  get 'favorites/new'
  get 'users/new'
  get 'topics/new'
  get 'top/new'
  root 'top#new'

  resources :users
  resources :topics
  resources :comments
  resources :sessions
  resources :randomtitles

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  delete '/topics', to: 'topics#destroy'
  get '/post/hashtag/:name', to: 'topics#hashtag'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
