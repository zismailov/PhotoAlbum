class AlbumDecorator < BaseDecorator
  delegate :title, :description, :parent_album_id

  def child_albums
    @child_albums ||= object.child_albums
  end

  def possible_parents
    if object.persisted?
      h.current_user.albums.where.not(id: object.id)
    else
      h.current_user.albums
    end.order(title: :asc)
  end

  def navigation_class
    object.child_albums.any? ? "has-dropdown not-click" : ""
  end
end
