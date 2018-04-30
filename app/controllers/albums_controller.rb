class AlbumsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html, :js

  expose_decorated(:album, attributes: :album_params)

  def new; end

  def create
    album.user = current_user
    if album.save
      redirect_to album_photos_path(album)
    else
      respond_with album
    end
  end

  def edit; end

  def update
    if album.save
      RefreshPhotosOrder.call(album: album)
      redirect_to album_photos_path(album)
    else
      respond_with album
    end
  end

  def destroy
    album.destroy
    redirect_to albums_url, notice: "Album was successfully destroyed."
  end

  private

  def album_params
    params.require(:album).permit(:title, :description, :parent_album_id, photos_order: [])
  end
end
