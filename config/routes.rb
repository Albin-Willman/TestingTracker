Rails.application.routes.draw do
  
  resources :issues

  resources :github_tokens

  resources :test_suites do
    resources :features do
      member do
        post 'approve'
      end
    end
  end

  resource :user
  get 'users', to: 'users#index'
  resources :user_sessions, only: [:create]
  get 'logout', to: 'user_sessions#destroy', as: 'logout'


  root to: 'user_sessions#new'
end
