Rails.application.routes.draw do
  get 'kid_events/new'

  get 'parent/panel', to: 'parent_panel#index'

  get 'kid/panel', to: 'kid_panel#index'


  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users

  resources :events, shallow: true do
    resources :kid_events do
      resources :comments
    end
end

end
