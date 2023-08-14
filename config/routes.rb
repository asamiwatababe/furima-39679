Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: :index
  get 'items', to: 'items#index'

  
end
