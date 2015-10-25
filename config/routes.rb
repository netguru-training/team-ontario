Rails.application.routes.draw do
  get 'kid_events/new'

  get 'parent/panel', to: 'parent_panel#index'

  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users

  resources :events

  resources :kid_events do
    resources :comments
  end

end
