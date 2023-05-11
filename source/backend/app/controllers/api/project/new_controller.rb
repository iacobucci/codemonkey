class Api::NewController < AuthenticationController
  before_action :extract_params_and_validate

  def new
    @current_user = current_user

    if @current_user.type == "Company"
      project = current_user.new_project(title: @permitted_params[:title], codemonkey: User.find(@permitted_params[:codemonkey]))
      project.save
    end
  end

  private

  def extract_params_and_validate
    @errors ||= []

    begin
      @permitted_params = params.require(:new).permit(:title, :codemonkey)
    rescue ActionController::ParameterMissing => e
      @errors.push("Missing parameters #{e.param}")
    rescue ActionController::UnpermittedParameters => e
      @errors.push("Unpermitted parameters #{e.params}")
    end

    except 400 if @errors.any?

    validate_title
    validate_codemonkey
  end

  def validate_codemonkey
    codemonkey = @permitted_params[:codemonkey]
    if !User.exists?(username: codemonkey)
      @errors.push("User does not exist")
    end
    if User.find(codemonkey).type != "Codemonkey"
      @errors.push("User is not a codemonkey")
    end
  end

  def validate_title
    title = @permitted_params[:title]
    if title.length > 255
      @errors.push("Title is too long")
    end
  end
end
