Rails.application.routes.draw do
  root 'recipes#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :recipes do
    resources :ingredients
    resources :instructions
  end

  get 'users/signup', to: 'users#new'
  resources :users, except: :new
end
