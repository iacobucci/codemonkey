class Api::User::DeleteController < AuthenticationController
  def delete
    @current_user = current_user
    username = @current_user.username

    catch :error do
      case @current_user.type
      when "Codemonkey"
        @current_user.destroy
      when "Company"
        @current_user.destroy
      else
        except 400, ["Invalid user type"]
      end
    end
    Action.create(user: username, name: "/user/delete", time: DateTime.now)
    render json: { status: "Deleted" }, status: :ok
  end
end
