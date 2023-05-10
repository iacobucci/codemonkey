class Api::DeleteController < AuthenticationController
  def delete
    @current_user = current_user

    case @current_user.type
    when "Codemonkey"
      @current_user.delete
    when "Company"
      @current_user.delete
    else
      render json: { errors: ["Invalid request"] }, status: :unauthorized
      return
    end

    render json: { status: "Deleted" }, status: :ok
  end
end
