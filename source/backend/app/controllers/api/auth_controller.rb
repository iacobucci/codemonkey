require "json_web_token"

class Api::AuthController < Api::BaseController
  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      if user.authenticate_otp(params[:totp])
        jwt = JsonWebToken.encode(user_id: user.id)
        render json: { username: user.username, jwt: jwt }, status: :ok
      else
        render json: { error: "Invalid TOTP." }, status: :unauthorized
      end
    else
      render json: { error: "Invalid username or password." }, status: :unauthorized
    end
  end
end
