class Api::Report::SendController < AuthenticationController
  before_action :validate_params

  def send_report
    catch :error do
      report = @current_user.report_user(to: @to, description: @permitted_params[:description])
      Action.new(user: @current_user, name: "/report/send", time: Time.now, description: "to=#{@to.username}&description=#{@permitted_params[:description]}").save
      report.save
      render json: { status: "ok" }, status: :ok
    end
  end

  def validate_params
    catch :error do
      extract_params_and_validate(:send, [:to, :description])
      validate_to
      validate_description
    end
  end

  def validate_to
    @to = User.find_by(username: @permitted_params[:to])
    if !@to
      except 404, ["User not found."]
    end
  end

  def validate_description
    if @permitted_params[:description].blank?
      except 400, ["Description not given."]
    end

    if @permitted_params[:description].length >= 2048
      except 400, ["Description too long."]
    end
  end
end
