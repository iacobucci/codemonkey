class Api::Project::InterruptController < AuthenticationController
  before_action :validate_params

  def interrupt
    catch :error do
      @current_user = current_user
      if current_user.type != "Codemonkey"
        except 401, ["User is not a codemonkey"]
      end
      if @project.codemonkey != current_user
        except 401, ["User is not the codemonkey of this project"]
      end
      @current_user.interrupt_project(project: @project, comment: @comment).save
      Action.new(user: @current_user, action_type: "/project/interrupt", description: "id=#{@project.id}&comment=#{@comment}", time: Time.now)
      render json: { status: "ok" }, status: :ok
    end
  end

  def validate_params
    catch :error do
      extract_params_and_validate(:interrupt, [:id, :comment])
      validate_project
      validate_comment
    end
  end

  def validate_project
    @project = Project.find_by(id: @permitted_params[:id])
    if @project.nil?
      except 400, ["Invalid project id"]
    end
  end

  def validate_comment
    @comment = @permitted_params[:comment]
    if @comment
      if @comment.length >= 2048
        except 400, ["Comment is too long"]
      end
    end
  end
end
