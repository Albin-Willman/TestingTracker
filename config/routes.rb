Rails.application.routes.draw do
  resources :bug_bashes

  resource :user
  resources :user_sessions, only: [:create]
  get 'logout', to: 'user_sessions#destroy', as: 'logout'

  root to: 'user_sessions#new'
end
