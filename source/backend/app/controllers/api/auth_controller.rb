require 'json_web_token'
class Api::AuthController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      if user.authenticate_otp(params[:totp])
        render json: { id: user.id }
      else
        render json: { error: 'Invalid TOTP.' }, status: :unauthorized
      end
    else
      render json: { error: 'Invalid username or password.' }, status: :unauthorized
    end
  end
end