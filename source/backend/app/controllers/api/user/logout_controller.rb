class Api::User::LogoutController < AuthenticationController
  def logout
    Action.create(user: @current_user, name: "/logout", time: DateTime.now)
  end
end
