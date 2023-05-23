class Api::Feed::UserController < AuthenticationController
  before_action :validate_params

  def user
    if @user.type == "Company"
      if @current_user != @user
        catch :error do
          except 403, ["You are not authorized to view this user's profile."]
        end
        return
      end
    end

    projects = @user.projects

    unless @permitted_params[:technologies].nil? || @permitted_params[:technologies].empty?
      projects = projects.select do |project|
        (@permitted_params[:technologies] - project.technologies.map(&:name)).empty?
      end
    end

    unless @permitted_params[:seen].nil? || @permitted_params[:seen].empty?
      projects = projects.reject { |project| @permitted_params[:seen].include?(project.id) }
    end

    data = projects.sort_by { |obj| obj.suggestion_time }.reverse.take(4).map(&:index)

    render json: data, status: :ok
  end

  def validate_params
    catch :error do
      extract_params_and_validate(:user, [:username, technologies: [], seen: []])
      validate_username
      validate_technologies
      validate_seen
    end
  end

  def validate_username
    @user = User.find_by(username: @permitted_params[:username])
    if @user.nil?
      except(400, ["Username does not exist."])
    end
  end

  def validate_technologies
    # @permitted_params[:technologies] is like ["name1", "name2"]
    if @permitted_params[:technologies].nil?
      @technologies = nil
    elsif !@permitted_params[:technologies].is_a?(Array)
      except(400, ["Invalid technologies"])
    else
      @technologies = []
      @permitted_params[:technologies].each do |technology_name|
        technology = Technology.find_by(name: technology_name)
        if technology.nil?
          except(400, ["Invalid technology #{technology_name}."])
        end
        @technologies << technology
      end
    end
  end

  def validate_seen
    if @permitted_params[:seen].nil?
      except(400, ["Missing parameter seen"])
    elsif !@permitted_params[:seen].is_a?(Array)
      except(400, ["Invalid seen"])
    else
      @permitted_params[:seen].each do |project|
        if !Project.exists?(id: project)
          except(400, ["Invalid project #{project}"])
        end
      end
    end
  end
end
