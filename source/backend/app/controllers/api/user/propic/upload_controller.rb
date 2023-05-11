require "mini_magick"
require "tempfile"

class Api::User::Propic::UploadController < AuthenticationController
  def upload
    catch :error do
      image = MiniMagick::Image.read(params[:propic].read)

      image.combine_options do |b|
        b.gravity "center"
        b.resize "256x256^"
        b.crop "256x256+0+0"
        b.define "webp:lossless=False"
      end

      @current_user.update_column(:propic, image.to_blob)
      Action.create(user: @current_user, name: "/user/propic/upload", time: DateTime.now)
    end

    render json: {
      status: "ok",
    }, status: :ok
  end
end
