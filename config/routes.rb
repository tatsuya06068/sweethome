Rails.application.routes.draw do
  namespace :admins do
    resources :admin
  end
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  namespace :admin do
      resources :product
      get '/home', to: 'home#index'
      root to:  'home#index'
  end
  root to: 'top#index'
  get '/top', to: 'top#index'

  resources :products, only: [:index, :show]
end
