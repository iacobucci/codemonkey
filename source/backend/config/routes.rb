Rails.application.routes.draw do
  namespace :api do
    post "getappname", to: "app_names#getappname"

    post "login", to: "login#login"
    post "signup", to: "signup#signup"
    post "delete", to: "delete#delete"
    post "logout", to: "logout#logout"
  end
end
