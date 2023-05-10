class Api::ImagesController < BaseController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    image = Image.find(params[:id])
    send_data(image.image.file.read, type: image.image.file.content_type, disposition: "inline")
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Image not found." }, status: :not_found
  end
end
