Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users

  resources :families do
    resources :events
  end
end
