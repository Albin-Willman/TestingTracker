Rails.application.routes.draw do
  
  resources :test_suites do
    resources :features
  end

  resource :user
  get 'users', to: 'users#index'
  resources :user_sessions, only: [:create]
  get 'logout', to: 'user_sessions#destroy', as: 'logout'


  root to: 'user_sessions#new'
end
