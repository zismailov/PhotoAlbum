class Photo < ApplicationRecord
  mount_uploader :picture, PictureUploader

  validates :album_id, presence: true

  belongs_to :album

  def processed?
    processing_status == "finished"
  end
end
