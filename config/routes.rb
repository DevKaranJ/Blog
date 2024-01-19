Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
      member do
        post 'like', to: 'likes#create', as: :like
      end
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get '/up', to: 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'users#index'
end
