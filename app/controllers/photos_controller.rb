class PhotosController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
    @photos = @album.photos
  end

  def show; end

  def new
    @photo = Photo.new
  end

  def edit; end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to @photo, notice: "Photo was successfully created."
    else
      render :new
    end
  end

  def update
    if @photo.update(photo_params)
      redirect_to @photo, notice: "Photo was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_url, notice: "Photo was successfully destroyed."
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :description, :album_id, :picture)
  end
end
