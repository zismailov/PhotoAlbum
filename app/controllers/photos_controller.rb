class PhotosController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  expose_decorated(:photo, attributes: :photo_params)
  expose_decorated(:album) { photo.album }

  def index; end

  def show; end

  def create
    # add policy based check if album is accessible by
    # current_user for write
    album = current_user.albums.find(params[:album_id])

    photo.title = photo_title
    photo.album_id = album.id
    photo.processing_status = "in_progress"
    photo.save

    PhotoProcessor.perform_async(photo.id, photo_path, remote_url)
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

  def photo_params
    params.require(:photo).permit(:title, :description, :album_id, :picture, :remote_picture_url)
  end
end
