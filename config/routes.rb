Rails.application.routes.draw do
  get 'kid_events/new'
  get 'kid_events/index'

  get 'parent/panel', to: 'parent_panel#index'

  get 'kid/panel', to: 'kid_panel#index'

  get 'kid_events/set_as_done'

  root to: 'visitors#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users

  resources :events, shallow: true do
    resources :kid_events do
      resources :comments
    end
end

end
