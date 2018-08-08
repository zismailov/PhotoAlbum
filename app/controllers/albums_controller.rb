class AlbumsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html, :js

  expose_decorated :top_level_albums, :current_user_top_level_albums
  expose_decorated :album, attributes: :album_params

  def new; end

  def show
    respond_with album
  end

  def create
    album.user = current_user
    album.save

    respond_with album
  end

  def edit; end

  def update
    album.save
    RefreshPhotosOrder.call(album: album)

    respond_with album
  end

  def destroy
    album.destroy
    respond_with album
  end

  private

  def album_params
    params.require(:album).permit(:title, :description, :parent_album_id, photos_order: [])
  end

  def current_user_top_level_albums
    current_user.top_level_albums
  end
end
