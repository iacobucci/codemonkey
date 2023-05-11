class Api::User::SignupController < ApplicationController
  before_action :validate_params

  def signup
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
      Action.create(user: user, name: "/user/signup", time: DateTime.now, description: "username=#{user.username}&email=#{user.email}")
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

      catch :error do
        except 500
      end
    end
  end

  private

  def validate_params
    catch :error do
      extract_params_and_validate(:signup, [:username, :password, :email, :type])
      validate_type
      validate_password
    end
  end

  def validate_type
    type = @permitted_params[:type]
    unless %w[Company Codemonkey].include?(type)
      @errors.push("Invalid type")
    end
    except 400 if @errors.any?
  end

  def validate_password
    password = @permitted_params[:password]
    if password.length < 8
      @errors.push("Password must be at least 8 characters long")
    end
    except 400 if @errors.any?
  end
end
