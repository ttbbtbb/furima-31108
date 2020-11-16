Rails.application.routes.draw do
  root to: 'checks#index'
  get 'checks/index'
  resources :items
  devise_for :users
end
