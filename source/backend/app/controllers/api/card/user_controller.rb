class Api::Card::UserController < ApplicationController
  before_action :validate_params

  def index
    render json: @user.card, status: :ok
  end

  def validate_params
    catch :error do
      extract_params_and_validate(:user, [:username])
      validate_username
    end
  end

  def validate_username
    @user = User.find_by(username: @permitted_params[:username])
    if @user.nil?
      except(400, ["Username does not exist."])
    end
  end
end
