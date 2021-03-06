Rails.application.routes.draw do
  resources :type_formats
  resources :categories
  resources :urlmarks

  get "api/category/:id", to: "categories#api"

  root 'urlmarks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
