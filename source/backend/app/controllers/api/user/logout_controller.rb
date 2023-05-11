class Api::LogoutController < AuthenticationController
  def logout
    Action.create(user: @current_user.username, name: "/logout", time: DateTime.now)
  end
end
