Rails.application.routes.draw do
  root to: 'users#index'
  resources :users
  resources :questions do
    resources :responses
  end

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  get 'logout', to: "sessions#destroy"

end
