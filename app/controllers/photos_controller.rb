class PhotosController < ApplicationController
  before_action :authenticate_user!

  before_action :set_album, only: %w[index create]
  before_action :set_photo, only: %w[show update destroy]

  respond_to :html

  def index
    @photos = @album.photos
  end

  def create
    PhotoProcessorWorker.perform_async(@album.id, photo_title, photo_path, remote_url)
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
    @album = Album.find(params[:album_id])
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :album_id, :picture, :remote_picture_url)
  end
end
