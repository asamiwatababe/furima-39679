Rails.application.routes.draw do
  root to: 'items#index'
  resources :items, only: :index
  get 'items', to: 'items#index'

  
end
