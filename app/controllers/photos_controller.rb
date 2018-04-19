class PhotosController < ApplicationController
  before_action :authenticate_user!

  before_action :set_album, only: %w[index create]
  before_action :set_photo, only: %w[show update destroy]

  respond_to :html

  def index
    @photos = @album.photos
  end

  def create
    PhotoProcessor.perform_async(params)
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
