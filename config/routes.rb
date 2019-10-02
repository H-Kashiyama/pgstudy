Rails.application.routes.draw do
  #root to: 'toppages#index'
  root to: 'ctgs#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
 
  resources :ctgs
  resources :tchings
  get 'signup', to: 'users#new' #ユーザの新規登録 URL を /signup にするため
  resources :users, only: [:index, :show, :new, :create]
  
end
