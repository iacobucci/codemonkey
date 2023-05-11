Rails.application.routes.draw do
  namespace :api do
    namespace :user do
      post "login", to: "login#login"
      post "signup", to: "signup#signup"
      post "delete", to: "delete#delete"
      post "logout", to: "logout#logout"
      post "settings", to: "settings#settings"

      namespace :propic do
        post "upload", to: "upload#upload"
        post "download", to: "download#download"
        post "delete", to: "delete#delete"
      end
    end

    namespace :project do
      post "new", to: "new#new"
      post "edit", to: "edit#edit"
      post "terminate", to: "terminate#terminate"
      post "accept", to: "accept#accept"
      post "reject", to: "reject#reject"
    end

    namespace :report do
      post "send", to: "send#send"
      post "ban", to: "ban#ban"
    end

    namespace :technology do
      post "suggest", to: "suggest#suggest"
      post "approve", to: "approve#approve"
      post "reject", to: "reject#reject"
    end

    namespace :feed do
      post "feed", to: "feed#feed"
      post "codemonkey", to: "codemonkey#codemonkey"
      post "company", to: "company#company"
    end

    namespace :card do
      post "user", to: "user#index"
    end
  end
end
