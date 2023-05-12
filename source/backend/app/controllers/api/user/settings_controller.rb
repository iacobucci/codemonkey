class Api::User::SettingsController < AuthenticationController
  before_action :validate_params

  def settings
    changed = []
    case @current_user.type
    when "Company"
      if @permitted_params[:name]
        changed.push({ name: @permitted_params[:name] })
        @current_user.change_name(new_name: @permitted_params[:name])
      end
    when "Codemonkey"
      if @permitted_params[:first_name]
        changed.push({ first_name: @permitted_params[:first_name] })
        @current_user.change_first_name(new_first_name: @permitted_params[:first_name])
      end
      if @permitted_params[:last_name]
        changed.push({ last_name: @permitted_params[:last_name] })
        @current_user.change_last_name(new_last_name: @permitted_params[:last_name])
      end
    end
    if ["Codemonkey", "Company"].include?(@current_user.type)
      if @permitted_params[:bio]
        changed.push({ bio: @permitted_params[:bio] })
        @current_user.change_bio(new_bio: @permitted_params[:bio])
      end

      if @permitted_params[:technologies]
        technologies = []
        # @permitted_params[:technologies] looks like["name1", "name2"]
        for technology_name in @permitted_params[:technologies]
          technology = Technology.find_by(name: technology_name)
          if technology.nil?
            @errors.push("Invalid technology #{technology_name}.")
          else
            technologies.push(technology)
          end
        end

        changed.push({ technologies: technologies.map(&:name).join(", ") })
        @current_user.change_technologies(new_technologies: technologies)
      end
    end

    if @permitted_params[:email]
      changed.push({ email: @permitted_params[:email] })
      @current_user.change_email(new_email: @permitted_params[:email])
    end
    if @permitted_params[:password]
      changed.push({ password: "********" })
      @current_user.change_password(new_password: @permitted_params[:password])
    end

    catch :error do
      if @errors.any?
        except 400
      end

      Action.create(user: @current_user, name: "/user/settings", time: DateTime.now, description: changed.map { |change| change.map { |key, value| "#{key}=#{value}" }.join("&") }.join("&"))
      if @current_user.save
        render json: { message: "Settings changed" }, status: :ok
      else
        except 500
      end
    end
  end

  private

  def validate_params
    case @current_user.type
    when "Company"
      extract_params_and_validate(:settings, [:name, :password, :email, :bio, technologies: []])
    when "Codemonkey"
      extract_params_and_validate(:settings, [:first_name, :last_name, :password, :email, :bio, technologies: []])
    else
      extract_params_and_validate(:settings, [:password, :email])
    end
    catch :error do
      validate_password
    end
  end

  def validate_password
    password = @permitted_params[:password]
    if password && password.length < 8
      @errors.push("Password must be at least 8 characters long")
      except 400 if @errors.any?
    end
  end
end
