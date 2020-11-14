Rails.application.routes.draw do
  root to: 'checks#index'
  get 'checks/index'
  devise_for :users
end
