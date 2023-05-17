class Api::Project::TerminateController < AuthenticationController
  before_action :validate_params

  def terminate
    catch :error do
      @current_user = current_user
      if current_user.type != "Company"
        except 401, ["User is not a codemonkey"]
      end
      if @project.company != current_user
        except 401, ["User is not the codemonkey of this project"]
      end
      @current_user.terminate_project(project: @project, rating: @rating, comment: @comment).save
      Action.new(user: @current_user, name: "/project/terminate", description: "id=#{@project.id}&comment=#{@comment}&rating=#{@rating}", time: Time.now)

      @project.codemonkey.update_rating
      @project.codemonkey.save
      render json: { status: "ok" }, status: :ok
    end
  end

  def validate_params
    catch :error do
      extract_params_and_validate(:terminate, [:id, :comment, :rating])
      validate_project
      validate_comment
      validate_rating
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

  def validate_rating
    @rating = @permitted_params[:rating].to_i
    if @rating
      if @rating < 0 || @rating > 5
        except 400, ["Rating is invalid"]
      end
    end
  end
end
