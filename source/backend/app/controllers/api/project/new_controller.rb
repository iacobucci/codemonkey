class Api::Project::NewController < AuthenticationController
  before_action :validate_params

  def new
    catch :error do
      @current_user = current_user

      if @current_user.type == "Company"
        project = current_user.new_project(title: @permitted_params[:title], codemonkey: @codemonkey, description: @permitted_params[:description], technologies: @technologies)

        Action.new(user: @current_user, action_type: "/project/new", description: "title=#{project.title}&codemonkey=#{codemonkey.username}&description=#{permitted_params[:description]}&technologies=#{@technologies.map(&:name)}", time: Time.now).save
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
      extract_params_and_validate(:new, [:title, :codemonkey, :description, technologies: []])
      validate_title
      validate_codemonkey
      validate_technologies
      validate_description
    end
  end

  def validate_codemonkey
    codemonkey = @permitted_params[:codemonkey]
    if !User.exists?(username: codemonkey)
      @errors.push("User does not exist")
    end
    @codemonkey = User.find_by(username: codemonkey)
    if @codemonkey.type != "Codemonkey"
      @errors.push("User is not a codemonkey")
    end
  end

  def validate_title
    title = @permitted_params[:title]
    if title.length > 255
      @errors.push("Title is too long")
    end
  end

  def validate_technologies
    @technologies = []
    for technology_name in @permitted_params[:technologies]
      technology = Technology.find_by(name: technology_name)
      @technologies.push(technology)
      if technology.nil?
        except 400, ["Invalid technology #{technology_name}."]
      end
    end
  end

  def validate_description
    description = @permitted_params[:description]
    if description.length > 255
      @errors.push("Description is too long")
    end
  end
end
