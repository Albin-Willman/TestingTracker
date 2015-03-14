Rails.application.routes.draw do
  resources :features

  resources :test_suites

  resources :bug_bashes

  resource :user
  get 'users', to: 'users#index'
  resources :user_sessions, only: [:create]
  get 'logout', to: 'user_sessions#destroy', as: 'logout'


  root to: 'user_sessions#new'
end
