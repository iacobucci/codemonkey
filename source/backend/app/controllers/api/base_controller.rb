class Api::BaseController < ActionController::API
  #   before_action :authenticate_user!

  private

  def authenticate_user!
    header = request.headers["Authorization"]
    jwt = header.split(" ").last if header
    @current_user ||= JsonWebToken.decode(jwt) if jwt
    raise "Access denied." unless @current_user
  rescue => exception
    raise "Access denied." if exception.message == "Expired"
    render json: { error: "Access denied." }, status: :unauthorized
  end
end
