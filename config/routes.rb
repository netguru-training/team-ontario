Rails.application.routes.draw do
  get 'parent_panel/index'

  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :events
end
