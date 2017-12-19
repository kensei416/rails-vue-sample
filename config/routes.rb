Rails.application.routes.draw do
  root 'home#index'
  get '/account', to: 'home#index'
  get '/contact', to: 'home#index'
  
  namespace :api, format: 'json' do
    resources :tasks, only: [:index, :create, :update]
  end
end
