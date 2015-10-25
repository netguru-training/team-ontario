Rails.application.routes.draw do
  get 'parent/panel', to: 'parent_panel#index'

  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :events

  resources :kid_events

  resources :kid_events do
    resources :comments
  end
end
