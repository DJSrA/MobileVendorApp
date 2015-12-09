Rails.application.routes.draw do
  resources :vendors

  get 'home/index'

  root "home#index"

end