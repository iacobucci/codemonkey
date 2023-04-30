Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  # post '/login', to: 'authentication#create'
  
  namespace :api do
    post 'getappname', to: 'app_names#getappname'
    post 'showpassword', to: 'logins#show_password'
    get "rails", to: "rails#index"

    post 'auth', to: 'auth#create'
    resources :registrations, only: :create
  end
end
