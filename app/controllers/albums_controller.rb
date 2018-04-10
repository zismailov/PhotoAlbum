class AlbumsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  expose(:album, attributes: :album_params) # Album.new or Album.find(id)

  def index
    @albums = current_user.top_level_albums
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
    params.require(:album).permit(:title, :description, :parent_album_id)
  end
end
