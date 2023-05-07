class Api::DeleteController < AuthenticationController
  def delete
    @current_user = current_user
    puts "delete controller"
    puts "current user #{@current_user}"

    case @current_user.kind
    when "codemonkey"
      @current_user.codemonkey.delete
    when "company"
      @current_user.company.delete
    when "admin"
      render json: { status: "Invalid request" }, status: :unauthorized
      return
    end

    @current_user.delete

    render json: { status: @current_user }, status: :ok
  end
end
