require "json_web_token"

class Api::User::LoginController < ApplicationController
  before_action :validate_params

  def login
    Action.create(user: @user, name: "/user/login", time: DateTime.now, description: "username=#{@permitted_params[:username]}")
    render json: { username: @user.username, type: @user.type, jwt: @jwt }, status: :ok
  end

  def validate_params
    extract_params_and_validate(:login, [:username, :password, :totp])
    catch :error do
      validate_user
      validate_password
      validate_totp
    end
  end

  def validate_user
    @user = User.find_by(username: @permitted_params[:username])
    if !@user.present?
      except 401, ["Invalid username"]
    end
  end

  def validate_password
    if !@user.authenticate(@permitted_params[:password])
      except 401, ["Invalid password"]
    end
  end

  def validate_totp
    if @user.authenticate_otp(@permitted_params[:totp])
      @jwt = JsonWebToken.encode(user_id: @user.username)
    else
      except 401, ["Invalid TOTP"]
    end
  end
end
