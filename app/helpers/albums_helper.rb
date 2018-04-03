module AlbumsHelper
  def album_navigation_class(album)
    album.child_albums.any? ? "has-dropdown not-click" : ""
  end
end
