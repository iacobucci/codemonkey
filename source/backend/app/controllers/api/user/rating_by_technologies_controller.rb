class Api::User::RatingByTechnologiesController < ApplicationController
  before_action :validate_params

  def rating_by_technologies
    render json: @user.rating_by_technologies(@technologies), status: :ok
  end

  def validate_params
    catch :error do
      extract_params_and_validate(:rating_by_technologies, [:username, technologies: [:name]])
      validate_username
      validate_technologies
    end
  end

  def validate_username
    @user = User.find_by(username: @permitted_params[:username])
    if @user.nil?
      except(400, ["Username does not exist."])
    end
    if @user.type != "Codemonkey"
      except(400, ["User is not a Codemonkey."])
    end
  end

  def validate_technologies
    if @permitted_params[:technologies].nil?
      @technologies = nil
    elsif !@permitted_params[:technologies].is_a?(Array)
      except(400, ["Invalid technologies"])
    else
      @technologies = []

      @permitted_params[:technologies].each do |tech|
        technology = Technology.find_by(name: tech[:name])
        if technology.nil?
          except(400, ["Invalid technology #{tech.name}"])
        end
        @technologies.push(technology)
      end
    end
  end
end
