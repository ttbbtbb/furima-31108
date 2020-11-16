Rails.application.routes.draw do
  root to: 'items#index'
  get 'checks/index'
  resources :items
  devise_for :users
end
