Rails.application.routes.draw do
 root to: 'ctgs#index'
  resources :ctgs
  resources :tchings
end
