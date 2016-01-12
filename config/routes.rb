Rails.application.routes.draw do
  resources :vendors do
    get :autocomplete_vendor_name, :on => :collection
    get :autocomplete_vendor_id, :on => :collection
  end

  resources :sessions

  devise_for :users
  match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  # match '/sessions/new', to: 'devise/sessions#create', via: :post

  devise_scope :user do
    match '/sessions/user', to: 'devise/sessions#create', via: :post
    root 'home#index'
    delete "home/index" => "devise/sessions#destroy"
    get "/vendors" => "devise/sessions#new"
    authenticated :user do
      # get 'register', to: 'devise/registrations#new', as: :register
      get 'login', to: 'devise/sesssions#new', as: :login
      get 'logout', to: 'devise/sessions#destroy', as: :logout
    end

    unauthenticated do
      root 'sessions#new', as: :unauthenticated_root
    end
  end


  get 'home/index'

end