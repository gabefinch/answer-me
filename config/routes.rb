Rails.application.routes.draw do

  root to: 'home#index'

  resources :users
  resources :questions do
    resources :responses
  end
  resources :votes, only: [:create]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get 'logout', to: "sessions#destroy"
  get 'guest', to: "home#guest"

end
