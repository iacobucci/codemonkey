class Api::CurrentController < AuthenticationController
  before_action :validate_params

  def index
    render json: {
             status: "ok",
             user: @current_user,
           }, status: :ok
  end

  def validate_params
    puts "validate_params"
  end
end
