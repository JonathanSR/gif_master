Rails.application.routes.draw do
root 'users#new'
#root 'gifs#index'

  resources :favorites, only: [:new, :create, :show, :destroy, :index]

  resources :users, only:[ :create, :show] 

  resources :categories, only:[:new, :index, :create, :show, :destroy]

  resources :gifs, only: [:new, :index, :create]

  namespace :admin do
    resources :users , only:[:index]
  end

  get 'sign_up', to: 'users#new'
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

end
