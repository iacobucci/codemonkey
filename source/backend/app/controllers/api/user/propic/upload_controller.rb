require "mini_magick"
require "tempfile"

class Api::User::Propic::UploadController < AuthenticationController
  def upload
    @current_user = current_user

    catch :error do
      image = MiniMagick::Image.read(params[:propic].read)

      image.combine_options do |b|
        b.gravity "center"
        b.resize "256x256^"
        b.crop "256x256+0+0"
        b.define "webp:lossless=False"
      end
    end

    @current_user.update_column(:propic, image.to_blob)
    AuthenticationController::Action.create(user: @current_user.username, name: "/user/propic/upload", time: DateTime.now)

    render json: {
      status: "ok",
    }, status: :ok
  end
end
