class AlbumsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html, :js

  expose_decorated(:album, attributes: :album_params)

  def index
    @albums = current_user.top_level_albums.order(title: :asc)
  end

  def create
    album.user = current_user
    if album.save
      redirect_to albums_path
    else
      respond_with album
    end
  end

  def update
    if album.save
      refresh_photos_order!
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

  def refresh_photos_order!
    position = 0

    ActiveRecord::Base.transaction do
      album.photos_order.each do |photo_id|
        album.photos.find(photo_id).update_attribute("position", position)
        position += 1
      end
    end
  end

  def album_params
    params.require(:album).permit(:title, :description, :parent_album_id, photos_order: [])
  end
end
