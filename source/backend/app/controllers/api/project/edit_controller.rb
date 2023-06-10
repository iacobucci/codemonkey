class Api::Project::EditController < AuthenticationController
  before_action :validate_params

  def edit
    catch :error do
      @current_user = current_user

      if @current_user.type == "Company"
        new_title = @permitted_params[:title] ? @permitted_params[:title] : @project.title
        new_codemonkey = @codemonkey ? @codemonkey : @project.codemonkey
        new_description = @permitted_params[:description] ? @permitted_params[:description] : @project.description
        new_technologies = @technologies ? @technologies : @project.technologies

        project = current_user.edit_project(project: @project, new_title: new_title, new_codemonkey: new_codemonkey, new_description: new_description, new_technologies: new_technologies)

        # Action.new(user: @current_user, action_type: "/project/edit", description: "id=#{project.id}&new_title=#{new_title}&new_codemonkey=#{new_codemonkey.username}&new_description=#{new_description}&new_technologies=#{new_technologies.map(&:name)}", time=Time.now).save
        # Action.new(user: @current_user, action_type: "/project/edit", description: "id=#{project.id}&new_title=#{new_title}&new_codemonkey=#{new_codemonkey.username}&new_description=#{new_description}&new_technologies=TODO", time=Time.now).save

        project.save
      else
        except 401, ["User is not a company"]
      end

      render json: { status: "ok" }, status: :ok
    end
  end

  private

  def validate_params
    catch :error do
      extract_params_and_validate(:edit, [:id, :title, :codemonkey, :description, technologies: []])
      validate_project
      validate_title
      validate_codemonkey
      validate_technologies
      validate_description
    end
  end

  def validate_project
    @project = Project.find_by(id: @permitted_params[:id])
    if @project.nil?
      except 400, ["Invalid project id"]
    end
  end

  def validate_codemonkey
    codemonkey = @permitted_params[:codemonkey]
    if codemonkey
      if !User.exists?(username: codemonkey)
        @errors.push("User does not exist")
      end
      @codemonkey = User.find_by(username: codemonkey)
      if @codemonkey.type != "Codemonkey"
        @errors.push("User is not a codemonkey")
      end
    end
  end

  def validate_title
    title = @permitted_params[:title]
    if title
      if title.length > 255
        @errors.push("Title is too long")
      end
    end
  end

  def validate_technologies
    @technologies = []
    if @permitted_params[:technologies]
      for technology_name in @permitted_params[:technologies]
        technology = Technology.find_by(name: technology_name)
        @technologies.push(technology)
        if technology.nil?
          except 400, ["Invalid technology #{technology_name}."]
        end
      end
    end
  end

  def validate_description
    description = @permitted_params[:description]
    if description
      if description.length > 255
        @errors.push("Description is too long")
      end
    end
  end
end
