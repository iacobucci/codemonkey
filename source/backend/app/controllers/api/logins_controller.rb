#TODO - remove this controller and route once we have a better way to handle logins
class Api::LoginsController < ApplicationController
  def show_password
    username = params[:username]
    login = Login.find_by(username: username)

    if login
      render json: { username: login.username, password: login.password }
    else
      render json: { error: "Username not found" }, status: :not_found
    end
  end
end
