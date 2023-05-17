class Api::Dashboard::ActionsController < AuthenticationController
  before_action :validate_params

  def actions
    per_page = 10
    catch :error do
      if @current_user.type != "Admin"
        except 401, ["Invalid user"]
      end
    end

    if @permitted_params[:last_seen_id].present?
      actions = Action.where("id < ?", @permitted_params[:last_seen_id]).order(:time).reverse.take(per_page)
    else
      actions = Action.order(:time).reverse.take(per_page)
    end

    render json: actions.map(&:index), status: :ok
  end

  def validate_params
    catch :error do
      extract_params_and_validate(:actions, [:last_seen_id])
      validate_last_seen_id
    end
  end

  def validate_last_seen_id
    if @permitted_params[:last_seen_id]
      if !Action.exists?(id: @permitted_params[:last_seen_id])
        @errors.push("Invalid last_seen_id")
      end
    end
  end
end
