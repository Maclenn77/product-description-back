Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "products#create"

  # Routes for product and description
  resources :products do
    resources :descriptions
  end
end
