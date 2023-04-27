class AuthenticationController < ApplicationController
  # skip_before_action :verify_authenticity_token
  
  # def create
  #   login = Login.find_by_username(params[:username])
    
  #   if login&.authenticate(params[:password])
  #     render json: { message: "Logged in successfully" }, status: :ok
  #   else
  #     render json: { error: "Invalid username or password" }, status: :unauthorized
  #   end
  # end
end