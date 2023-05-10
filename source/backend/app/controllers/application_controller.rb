class ApplicationController < ActionController::API
  def errors
    @errors ||= []
  end

  def except(status, errors = @errors)
    render json: { status: status, errors: errors }, status: :unprocessable_entity
  end
end
