Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :products do
      resources :reviews
    end
  end
  resources :products, only: [:index]
  root 'categories#index'
  #get '/categories/:category_id/products', to: 'products#index'
  
end
