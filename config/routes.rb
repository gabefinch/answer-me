Rails.application.routes.draw do
  root to: 'users#index'
  resources :users

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get 'logout', to: "sessions#destroy"
  
end
