Rails.application.routes.draw do
  root 'recipes#index'

  resources :recipes

  get 'users/signup', to: 'users#new'
  resources :users, except: :new
end
