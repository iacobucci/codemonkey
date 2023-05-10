class AuthenticationController < ApplicationController
  before_action :authenticate_user!

  private

  def authenticate_user!
    header = request.headers["Authorization"]
    jwt = header.split(" ").last if header
    @current_username ||= JsonWebToken.decode(jwt) if jwt
    raise unless @current_username
    @current_user = User.find(@current_username.dig("user_id"))
    raise unless @current_user
  rescue => exception
    except 401, ["Invalid token"]
  end

  def current_user
    @current_user
  end
end
