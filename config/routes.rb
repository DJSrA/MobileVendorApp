Rails.application.routes.draw do
  resources :vendors

  devise_for :users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user

  devise_scope :user do
    authenticated :user do
      root 'vendors#index', as: :authenticated_root
    end

    unauthenticated do
      root 'sessions#new', as: :unauthenticated_root
    end
  end

  devise_scope :user do
    get "/recruiters/sign_up" => "recruiters/registrations#new"
    post "/recruiters/sign_up" => "recruiters/registrations#create"
  end

  get 'home/index'

  root "home#index"

end