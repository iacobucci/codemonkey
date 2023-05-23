class Api::Feed::HomeController < ApplicationController
  before_action :validate_params

  def home
    if @permitted_params[:type] == "Codemonkey"
      @users = User.where(type: "Codemonkey")
    elsif @permitted_params[:type] == "Company"
      @users = User.where(type: "Company")
    else
      @users = User.where(type: ["Codemonkey", "Company"])
    end

    @users = @users.select do |user|
      (@technologies & user.technologies) == @technologies
    end

    unless @permitted_params[:seen].nil? || @permitted_params[:seen].empty?
      @users = @users.reject { |user| @permitted_params[:seen].include?(user.username) }
    end

    data = @users.map(&:index).shuffle!.take(4)

    render json: data, status: :ok
  end

  def validate_params
    catch :error do
      extract_params_and_validate(:home, [:type, technologies: [:name], seen: []])
      validate_technologies
      validate_seen
      validate_type
    end
  end

  def validate_type
    if @permitted_params[:type].nil?
      except(400, ["Missing parameter type"])
    elsif !["Codemonkey"].include?(@permitted_params[:type])
      except(400, ["Invalid type"])
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
          except(400, ["Invalid technology #{tech.name}."])
        end
        @technologies.push(technology)
      end
    end
  end

  def validate_seen
    if @permitted_params[:seen].nil?
      except(400, ["Missing parameter seen"])
    elsif !@permitted_params[:seen].is_a?(Array)
      except(400, ["Invalid seen"])
    else
      @permitted_params[:seen].each do |username|
        if !User.exists?(username: username)
          except(400, ["Invalid username #{username}"])
        end
      end
    end
  end
end
