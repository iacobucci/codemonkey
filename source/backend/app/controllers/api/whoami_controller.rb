class Api::WhoamiController < AuthenticationController
  def whoami
    render json: { username: @current_user.username }, status: :ok
  end
end
