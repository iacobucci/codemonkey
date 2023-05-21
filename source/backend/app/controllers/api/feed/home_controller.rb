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

    unless @permitted_params[:technologies].nil? || @permitted_params[:technologies].empty?
      @users = @users.select do |user|
        (@permitted_params[:technologies] - user.technologies.map(&:name)).empty?
      end
    end

    unless @permitted_params[:seen].nil? || @permitted_params[:seen].empty?
      @users = @users.reject { |user| @permitted_params[:seen].include?(user.username) }
    end

    #TODO
    # 1. Filter by user.status == "active"
    data = @users.map(&:index).shuffle!.take(4)

    render json: data, status: :ok
  end

  def validate_params
    catch :error do
      extract_params_and_validate(:home, [:type, technologies: [], seen: []])
      validate_type
      validate_technologies
      validate_seen
    end
  end

  def validate_type
    # @permitted_params[:type].nil must be either "Codemonkey" or "Company" or "all"
    if @permitted_params[:type].nil?
      except(400, ["Missing parameter type"])
    elsif !["Codemonkey", "Company", "All"].include?(@permitted_params[:type])
      except(400, ["Invalid type"])
    end
  end

  def validate_technologies
    # @permitted_params[:technologies] is like ["name1", "name2"]
    if @permitted_params[:technologies].nil?
      @technologies = nil
    elsif !@permitted_params[:technologies].is_a?(Array)
      except(400, ["Invalid technologies"])
    else
      @technologies = []
      @permitted_params[:technologies].each do |technology_name|
        technology = Technology.find_by(name: technology_name)
        if technology.nil?
          except(400, ["Invalid technology #{technology_name}."])
        end
        @technologies << technology
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
