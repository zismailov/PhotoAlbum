class AlbumsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html, :js

  expose_decorated(:album, attributes: :album_params)

  def new; end

  def show; end

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
end
