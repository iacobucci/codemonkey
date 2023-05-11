class Api::Technology::RejectController < AuthenticationController
  before_action :validate_params

  def reject
    @technology.reject

    Action.create(user: @current_user, name: "/technology/reject", time: DateTime.now, description: @technology.name)
    render json: {
             status: "ok",
           }, status: :ok
  end

  def validate_params
    extract_params_and_validate(:approve, [:id])
    catch :error do
      validate_user
      validate_id
    end
  end

  def validate_user
    if @current_user.type != "Admin"
      except 401, ["Invalid user"]
    end
  end

  def validate_id
    if !Technology.exists?(@permitted_params[:id])
      except 401, ["Invalid id"]
    end
    @technology = Technology.find(@permitted_params[:id])
  end
end
