Rails.application.routes.draw do

  root "rants#index"
  get '/signup' => 'registrations#new', as: :signup
  post '/signup' => 'registrations#create'
  get '/signin' => 'authentication#new', as: :signin
  post '/signin' => 'authentication#create'
  get '/signout' => 'authentication#destroy', as: :signout
  get '/search' => 'rants#index', as: :search

  resources :users
  resources :rants

end
