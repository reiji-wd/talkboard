Rails.application.routes.draw do

  root to: 'rooms#index'
  resources :rooms, only: [:show, :new, :create] 
    
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create, :edit, :update, :destroy]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :comments, only: [:create]
end
