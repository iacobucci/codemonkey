class Api::Technology::RejectController < AuthenticationController
  before_action :validate_params

  def reject
    catch :error do
      if @current_user.type != "Admin"
        except 401, ["Invalid user"]
      end

      @technology.reject
    end

    Action.create(user: @current_user, name: "/technology/reject", time: DateTime.now, description: @technology.name)
    @technology.save
    render json: {
             status: "ok",
           }, status: :ok
  end

  def validate_params
    catch :error do
      extract_params_and_validate(:reject, [:name])
      validate_name
    end
  end

  def validate_name
    if !Technology.exists?(name: @permitted_params[:name])
      except 401, ["Invalid name"]
    end
    @technology = Technology.find_by(name: @permitted_params[:name])
  end
end
