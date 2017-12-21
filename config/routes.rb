Rails.application.routes.draw do



  root 'home#index'
  get '/tasks', to: 'home#index'
  get '/account', to: 'home#index'
  get '/contact', to: 'home#index'
  get '/setting', to: 'home#index'
  get '/signup', to: 'home#index'
  get '/login', to: 'home#index'
  
  namespace :api, format: 'json' do
    resources :tasks, only: [:index, :create, :update]
    resources :users, only: [:index, :show, :create, :update]
    resources :sessions, only: [:create, :destroy]
  end
end
