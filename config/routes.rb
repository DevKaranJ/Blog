Rails.application.routes.draw do
  # All users page
  get '/users', to: 'users#index', as: :users

  # Single user page
  get '/users/:id', to: 'users#show', as: :user

  # All posts by a given user page
  get '/users/:user_id/posts', to: 'posts#index', as: :user_posts

  # Single post page
  get '/users/:user_id/posts/:id', to: 'posts#show', as: :user_post

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get '/up', to: 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'users#index'
end
