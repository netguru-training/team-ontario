Rails.application.routes.draw do
  get 'parent/panel', to: 'parent_panel#index'

  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :kid_events do
    resources :comments
  end
end
