Rails.application.routes.draw do
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
