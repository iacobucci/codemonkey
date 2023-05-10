class Api::User::Propic::DeleteController < AuthenticationController
  def delete
    @current_user = current_user

    @current_user.update_column(:propic, nil)

    render json: {
      status: "ok",
    }, status: :ok
  end
end
