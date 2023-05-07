require "json_web_token"

class Api::LoginController < ApplicationController
  def login
    login_params = params.require(:login).permit(:username, :password, :totp)
    user = User.find_by(username: login_params[:username])

    if user.present?
      if user.authenticate(login_params[:password])
        if user.authenticate_otp(login_params[:totp])
          jwt = JsonWebToken.encode(user_id: user.username)
          render json: { username: user.username, kind: user.kind, jwt: jwt }, status: :ok
        else
          render json: { error: "Invalid TOTP" }, status: :unauthorized
        end
      else
        render json: { error: "Invalid password" }, status: :unauthorized
      end
    else
      render json: { error: "Invalid username" }, status: :unauthorized
    end
  end
end
