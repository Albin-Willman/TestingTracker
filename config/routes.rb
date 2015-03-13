Rails.application.routes.draw do
  resource :user
  resources :user_sessions, only: [:create]
  get 'logout', to: 'user_sessions#destroy', as: 'logout'

  root to: 'user_sessions#new'
end
