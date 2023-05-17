class Api::Report::BanController < AuthenticationController
  before_action :validate_params

  def ban
    catch :error do
      if @current_user.type != "Admin"
        except 401, ["Invalid user"]
      end

      @current_user.ban(@user, @permitted_params[:status])
      @user.save
      Action.new(user: @current_user, name: "/report/ban", time: DateTime.now, description: "username=#{@user.username}&status=#{@permitted_params[:status]}&reason=#{@permitted_params[:reason]}").save
      render json: { status: "ok" }, status: :ok
    end
  end

  def validate_params
    catch :error do
      extract_params_and_validate(:ban, [:username, :status, :reason])
      validate_name
      validate_status
      validate_reason
    end
  end

  def validate_name
    @user = User.find_by(username: @permitted_params[:username])
    if !@user
      except 404, ["User not found."]
    end
    if @user.type == "Admin"
      except 401, ["Invalid user"]
    end
  end

  def validate_status
    if @permitted_params[:status].blank?
      except 400, ["Status not given."]
    end

    if ["active", "suspended", "banned"].exclude? @permitted_params[:status]
      except 400, ["Status not valid."]
    end
  end

  def validate_reason
    if @permitted_params[:reason]
      if @permitted_params[:reason].length >= 2048
        except 400, ["Reason too long."]
      end
    end
  end
end
