class AlbumsController < ApplicationController
  respond_to :html

  expose(:album, attributes: :album_params)  # Album.new or Album.find(id)
  expose :albums, -> { current_user.albums } # expose :albums, from: :current_user.albums

  def create
    album.user = current_user
    album.save

    respond_with album
  end

  def update
    if album.save
      redirect_to album_photos_path
    else
      respond_with album
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_url, notice: "Album was successfully destroyed."
  end

  private

  def album_params
    params.require(:album).permit(:title, :description, :parent_album_id)
  end
end
