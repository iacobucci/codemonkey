class Api::Project::RejectController < AuthenticationController
  before_action :validate_params

  def reject
    catch :error do
      @current_user = current_user
      if current_user.type != "Codemonkey"
        except 401, ["User is not a codemonkey"]
      end
      if @project.codemonkey != current_user
        except 401, ["User is not the codemonkey of this project"]
      end
      @current_user.reject_project(project: @project).save
      Action.new(user: @current_user, action_type: "/project/reject", description: "id=#{@project.id}", time: Time.now)
      render json: { status: "ok" }, status: :ok
    end
  end

  def validate_params
    catch :error do
      extract_params_and_validate(:reject, [:id])
      validate_project
    end
  end

  def validate_project
    @project = Project.find_by(id: @permitted_params[:id])
    if @project.nil?
      except 400, ["Invalid project id"]
    end
  end
end
