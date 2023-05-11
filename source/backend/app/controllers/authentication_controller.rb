class AuthenticationController < ApplicationController
  before_action :authenticate_user!

  private

  def authenticate_user!
    catch :error do
      validate_header
      validate_username
      validate_user
    end
  end

  def validate_header
    header = request.headers["Authorization"]
    if header
      @jwt = header.split(" ").last
    else
      except 401, ["Token not provided"]
    end
  end

  def validate_username
    @current_username ||= JsonWebToken.decode(@jwt).dig("user_id")
    if !@current_username
      except 401, ["Invalid token"]
    end
  end

  def validate_user
    @current_user = User.find_by(username: @current_username)
    puts "trying to find user #{@current_username}"
    if !@current_user
      except 401, ["Invalid user"]
    end
  end

  def current_user
    @current_user
  end
end
