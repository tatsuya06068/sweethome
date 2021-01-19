Rails.application.routes.draw do
 root to: 'top#index'
 get '/top', to: 'top#index'
 
 get '/products', to: 'products#index'
 get '/products', to: 'products#show'
end
