class PhotoDecorator < BaseDecorator
  delegate :title, :picture, :processing_status

  def processed?
    processing_status == "finished"
  end

  def next_photo_id_from_album
    self_position = album.photos_order.index(id.to_s)

    if self_position + 1 == album.photos_order.length
      album.photos_order.first
    else
      album.photos_order[self_position + 1]
    end
  end

  def previous_photo_id_from_album
    self_position = album.photos_order.index(id.to_s)

    if self_position.zero?
      album.photos_order.last
    else
      album.photos_order[self_position - 1]
    end
  end
end
