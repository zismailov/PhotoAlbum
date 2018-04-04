module AlbumsHelper
  def album_navigation_class(album)
    album.child_albums.any? ? "has-dropdown not-click" : ""
  end

  def possible_parents_for(album)
    if album.persisted?
      current_user.albums.where.not(id: album.id)
    else
      current_user.albums
    end
  end
end
