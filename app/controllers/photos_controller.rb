class PhotosController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  expose(:photo)

  def index
    @album = Album.find(params[:album_id])
    @photos = @album.photos
  end

  def create
    @album = Album.find(params[:album_id])
    @photo = @album.photos.new

    @photo.title = File.basename(params[:filename], File.extname(params[:filename]))

    @photo.remote_picture_url = URI.decode_www_form photo_params[:remote_picture_url]
    @photo.save

    Amazon.delete_tmp_file(URI.decode_www_form(params[:filepath]))
  end

  def update
    if photo.update(photo_params)
      redirect_to photo, notice: "Photo was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    photo.destroy
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :album_id, :picture, :remote_picture_url)
  end
end
