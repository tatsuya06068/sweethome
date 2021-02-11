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
      resources :categories
      resources :materials
      resources :materials_useds
      resources :products
      resources :product_details

      root to: "categories#index"
    end
  root to: 'top#index'
  get '/top', to: 'top#index'

  get '/products', to: 'products#index'
  get '/products', to: 'products#show'
end
