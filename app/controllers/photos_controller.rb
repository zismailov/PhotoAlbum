class PhotosController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  expose(:album) { set_album }
  expose(:photo) { set_photo }

  def index; end

  def show
    @album = @photo.album
  end

  def create
    @photo = Photo.create title: photo_title,
                          album_id: album.id,
                          processing_status: "in_progress"

    PhotoProcessor.perform_async(@photo.id, photo_path, remote_url)
  end

  def update
    if @photo.update(photo_params)
      redirect_to photo, notice: "Photo was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
  end

  private

  def photo_title
    File.basename(params[:filename], File.extname(params[:filename]))
  end

  def photo_path
    URI.decode_www_form params[:filepath]
  end

  def remote_url
    URI.decode_www_form params[:photo][:remote_picture_url]
  end

  def set_album
    Album.find_by(id: params[:album_id]).decorate
  end

  def set_photo
    @photo = Photo.find_by(id: params[:id])
    @photo_policy = PhotoPolicy.new(current_user, @photo) if @photo
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :album_id, :picture, :remote_picture_url)
  end
end
