Rails.application.routes.draw do
  get '/login',     to: "sessions#new"
  post '/login',    to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  namespace :admin do
    resources :categories, only: [:new, :create, :index, :destroy]
    resources :images, only: [:index, :new, :create, :destroy]
  end

  resources :users, only: [:new, :create, :show, :destroy] do
    resources :ideas
  end

  root "welcome#index"
end
