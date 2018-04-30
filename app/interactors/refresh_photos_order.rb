class RefreshPhotosOrder
  include Interactor

  delegate :album, to: :context

  def call
    position = 0
    ActiveRecord::Base.transaction do
      album.photos_order.each do |photo_id|
        album.photos.find(photo_id).update("position", position)
        position += 1
      end
    end
  end
end
