Rails.application.routes.draw do
  root   'static_pages#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/newjob',  to: 'jobs#new'
  get    '/jobs',    to: 'jobs#index'
  resources :users
  resources :jobs, only: [:new, :create, :destroy, :show]
  resources :reviews

  resources :jobs do
    resources :reviews
  end

  resources :users do
    resources :reviews
  end

  resources :jobs do
    resources :bids
  end

  resources :users do
    resources :bids
  end

  # post '/jobs/:id/reviews/new', to: 'reviews#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
