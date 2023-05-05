class Api::UploadsController < Api::BaseController

  before_action :authenticate_user!, only: [:index]

  def create
    image = params[:image]
    @image_upload = Image.create(image: image)

    if @image_upload.save
      render json: { message: "L'immagine è stata salvata correttamente." }, status: :created
    else
      render json: { errors: @image_upload.errors }, status: :unprocessable_entity
    end
  end
end
