Rails.application.routes.draw do

  root "rants#index"

  resources :users
  resources :rants

end
