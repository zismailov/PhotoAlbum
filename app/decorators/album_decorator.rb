class AlbumDecorator < BaseDecorator
  delegate :title, :description, :parent_album_id

  decorates_association :parent_album
end
