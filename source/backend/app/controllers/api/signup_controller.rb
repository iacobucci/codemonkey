class Api::SignupController < ApplicationController
  def errors
    @errors ||= []
  end

  before_action :extract_params_and_validate

  def signup
    return except 500 if errors.any?

    user = User.new(username: @permitted_params[:username],
                    password: @permitted_params[:password],
                    email: @permitted_params[:email],
                    kind: @permitted_params[:kind])

    if user.save
      kind = build_kind(user)
      if kind.save
        render json: { user: user.username, kind: user.kind, otp_provisioning_uri: user.provisioning_uri }, status: :created
      else
        errors.push("Error creating kind")
        except 500
      end
    else
      errors.push("Error creating user")
      except 500
    end
  end

  private

  def extract_params_and_validate
    @errors ||= []
    begin
      @permitted_params = params.require(:signup).permit(:username, :password, :kind, :email)
    rescue ActionController::ParameterMissing => e
      errors.push("Missing parameters #{e.param}")
    rescue ActionController::UnpermittedParameters => e
      errors.push("Unpermitted parameters #{e.params}")
    end

    except 400 if errors.any?

    validate_email
    validate_username
    validate_kind
  end

  def validate_email
    email = @permitted_params[:email]
    if User.exists?(email: email)
      errors.push("Email already taken")
    elsif !valid_email?(email)
      errors.push("Invalid email")
    end
  end

  def validate_username
    username = @permitted_params[:username]
    #check if all characters in username are lowecase letters or numbers or underscore
    errors.push("Invalid username") unless username =~ /^[a-z0-9_]+$/
    errors.push("Username already taken") if User.exists?(username: username)
  end

  def validate_kind
    kind = @permitted_params[:kind]
    unless %w[company codemonkey].include?(kind)
      errors.push("Invalid type")
    end
  end

  def valid_email?(email)
    email.present? && URI::MailTo::EMAIL_REGEXP.match?(email)
  end

  def except(status)
    render json: { status: status, errors: errors }, status: :unprocessable_entity
  end

  def build_kind(user)
    case user.kind
    when "company"
      Company.new(username: user.username)
    when "codemonkey"
      Codemonkey.new(username: user.username)
    end
  end
end
