Rails.application.routes.draw do
  resources :vendors
  resources :sessions

  devise_for :users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  # match '/sessions/new', to: 'devise/sessions#create', via: :post

  devise_scope :user do
    match '/sessions/user', to: 'devise/sessions#create', via: :post
    authenticated :user do
      root 'vendors#index', as: :authenticated_root
      # get 'register', to: 'devise/registrations#new', as: :register
      get 'login', to: 'devise/sesssions#new', as: :login
      get 'logout', to: 'devise/sessions#destroy', as: :logout
    end

    unauthenticated do
      root 'sessions#new', as: :unauthenticated_root
    end
  end

  get 'home/index'

  root "home#index"

end