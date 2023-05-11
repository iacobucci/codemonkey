class Api::Technology::SuggestController < AuthenticationController
  before_action :validate_params

  def suggest
    @technology = Technology.suggest(name: @permitted_params[:name])

    if !@technology.valid?
      @errors.push("Invalid name")
    end
    if !@technology.save
      @errors.push("Invalid technology")
    end

    if @errors.any?
      catch :error do
        except 400
      end
    else
      Action.create(user: @current_user, name: "/technology/suggest", time: DateTime.now, description: @technology.name)
      render json: { status: "ok" }, status: :ok
    end
  end

  def validate_params
    extract_params_and_validate(:suggest, [:name])
  end
end
