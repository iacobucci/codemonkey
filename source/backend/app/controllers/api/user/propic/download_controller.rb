class Api::User::Propic::DownloadController < ApplicationController
  before_action :extract_params_and_validate

  def download
    user = User.find_by(username: @permitted_params[:username])

    if user&.propic
      send_data(
        user.propic,
        filename: "#{user.username}.jpg",
        content_type: "image/jpeg",
      )
    else
      render json: { errors: ["Profilo non trovato o immagine del profilo non disponibile"] }, status: :not_found
    end
  end

  private

  def extract_params_and_validate
    @errors = errors
    begin
      @permitted_params = params.require(:propic_download).permit(:username)
    rescue ActionController::ParameterMissing => e
      @errors.push("Missing parameter #{e.param}.")
    rescue ActionController::UnpermittedParameters => e
      @errors.push("Unpermitted parameter #{e.params}.")
    end

    catch :error do
      except 400 if @errors.any?
      validate_username
    end
  end

  def validate_username
    username = @permitted_params[:username]
    if username.nil?
      @errors.push("Missing parameter username.")
    else
      user = User.find_by(username: username)
      if user.nil?
        @errors.push("Invalid username.")
      end
    end
    except 400 if @errors.any?
  end
end
