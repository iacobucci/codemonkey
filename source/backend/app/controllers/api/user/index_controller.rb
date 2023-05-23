class Api::User::IndexController < AuthenticationController
  before_action :validate_params

  def index
    if @user.type == "Company"
      if @current_user != @user
        catch :error do
          except 403, ["You are not authorized to view this user's profile."]
        end
      end
    end

    render json: @user.index, status: :ok
  end

  def validate_params
    catch :error do
      extract_params_and_validate(:index, [:username])
      validate_username
    end
  end

  def validate_username
    @user = User.find_by(username: @permitted_params[:username])
    if @user.nil?
      except(400, ["Username does not exist."])
    end
  end
end
