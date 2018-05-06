class AlbumDecorator < BaseDecorator
  delegate :title, :description, :parent_album_id, :photos_order, :random_photo

  decorates_association :parent_album
  decorates_association :photos

  def random_photo_url
    random_photo.picture.thumbnail.url
  end

  def child_albums
    @child_albums ||= object.child_albums.order(title: :asc).decorate
  end

  delegate :count, to: :child_albums, prefix: true

  def child_albums?
    child_albums.any?
  end

  def user
    @user ||= object.user
  end

  def photos?
    photos.any?
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
