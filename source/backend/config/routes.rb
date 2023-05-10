Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # post '/login', to: 'authentication#create'

  namespace :api do
    get 'uploads/create'
    post "getappname", to: "app_names#getappname"
    post "showpassword", to: "logins#show_password"
    get "rails", to: "testget#index"

    post "auth", to: "auth#create"
    resources :registrations, only: :create
    resources :images, only: [:show], path: "img"
    resources :uploads, only: [:create]
  end
end
