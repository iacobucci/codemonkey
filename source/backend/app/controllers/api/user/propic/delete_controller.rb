class Api::User::Propic::DeleteController < AuthenticationController
  def delete
    @current_user = current_user
    @current_user.update_column(:propic, nil)

    Action.create(user: @current_user.username, name: "/user/propic/delete", time: DateTime.now)
    render json: {
      status: "ok",
    }, status: :ok
  end
end
