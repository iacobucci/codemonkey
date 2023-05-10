class Api::User::SignupController < ApplicationController
  before_action :extract_params_and_validate

  def signup
    return except 500 if @errors.any?

    case @permitted_params[:type]
    when "Company"
      user = Company.new(username: @permitted_params[:username],
                         password: @permitted_params[:password],
                         email: @permitted_params[:email])
    when "Codemonkey"
      user = Codemonkey.new(username: @permitted_params[:username],
                            password: @permitted_params[:password],
                            email: @permitted_params[:email])
    end

    if user.save
      render json: { username: user.username, type: user.type, otp_provisioning_uri: user.provisioning_uri }, status: :created
    else
      if user.errors[:username].any?
        @errors.push(user.errors[:username].first)
      end
      if user.errors[:password].any?
        @errors.push(user.errors[:password].first)
      end
      if user.errors[:email].any?
        @errors.push(user.errors[:email].first)
      end

      except 500
    end
  end

  private

  def extract_params_and_validate
    @errors = errors
    begin
      @permitted_params = params.require(:signup).permit(:username, :password, :type, :email)
    rescue ActionController::ParameterMissing => e
      @errors.push("Missing parameter #{e.param}.")
    rescue ActionController::UnpermittedParameters => e
      @errors.push("Unpermitted parameter #{e.params}.")
    end

    except 400 if @errors.any?

    validate_type
  end

  def validate_type
    type = @permitted_params[:type]
    unless %w[Company Codemonkey].include?(type)
      @errors.push("Invalid type")
    end
    except 400 if @errors.any?
  end
end
