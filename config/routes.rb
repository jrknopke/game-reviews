Rails.application.routes.draw do
  root "sessions#home"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#googleauth'
  
  resources :comments

  resources :users do
    resources :reviews, only: [:new,:create,:index]
    resources :comments, only: [:new, :create, :index]
  end
  resources :reviews do
    resources :comments, only: [:new,:create,:index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
