class Api::Dashboard::TechnologiesController < AuthenticationController
  def technologies
    if @current_user.nil?
      except 401, ["Invalid user"]
    end
    if @current_user.type != "Admin"
      except 401, ["Invalid user"]
    end

    @technologies = Technology.where(approved: false).where(rejected: false).order(:suggestion_time).reverse.map(&:index)
    render json: @technologies, status: :ok
  end
end
