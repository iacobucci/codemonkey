class ApplicationController < ActionController::API
  def errors
    @errors ||= []
  end

  def extract_params_and_validate(required_param, permitted_params)
    @errors = errors
    begin
      @permitted_params = params.require(required_param).permit(*permitted_params)
    rescue ActionController::ParameterMissing => e
      @errors.push("Missing parameter #{e.param}.")
    rescue ActionController::UnpermittedParameters => e
      @errors.push("Unpermitted parameter #{e.params}.")
    end

    except 400 if @errors.any?
  end

  def except(status, errors = @errors)
    render json: { status: status, errors: errors }, status: :unprocessable_entity
    throw :error
  end
end
