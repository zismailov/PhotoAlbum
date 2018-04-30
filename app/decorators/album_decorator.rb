class AlbumDecorator < BaseDecorator
  delegate :title, :description, :parent_album_id

  decorates_association :parent_album

  def child_albums
    @child_albums ||= object.child_albums.order(title: :asc).decorate
  end

  def user
    @user ||= object.user
  end

  def photos
    @photos ||= object.photos
  end

  def completely_empty?
    photos.empty? && child_albums.empty?
  end

  def possible_parents
    if object.persisted?
      current_user.albums.where.not(id: object.id)
    else
      current_user.albums
    end.order(title: :asc)
  end

  def navigation_class
    object.child_albums.any? ? "has-dropdown not-click" : ""
  end

  def random_photo
    photos.order("RANDOM()").first
  end

  def top_level_album?
    object.parent_album_id.nil?
  end

  def parents
    parents = []
    return parents if top_level_album?

    some_parent = parent_album

    until some_parent.top_level_album?
      parents << some_parent
      some_parent = some_parent.parent_album
    end
    parents << some_parent

    parents.reverse
  end
end
