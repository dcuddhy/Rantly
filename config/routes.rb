Rails.application.routes.draw do

  root "rants#index"
  get '/signup' => 'users#new', as: :signup
  post '/signup' => 'users#create'
  get '/signin' => 'authentication#new', as: :signin
  post '/signin' => 'authentication#create'
  get '/signout' => 'authentication#destroy', as: :signout



  resources :users
  resources :rants

end
