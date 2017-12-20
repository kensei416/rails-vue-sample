Rails.application.routes.draw do
  get 'users/new'

  root 'home#index'
  get '/tasks', to: 'home#index'
  get '/account', to: 'home#index'
  get '/contact', to: 'home#index'
  
  namespace :api, format: 'json' do
    resources :tasks, only: [:index, :create, :update]
  end
end
