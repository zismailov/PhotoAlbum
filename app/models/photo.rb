class Photo < ApplicationRecord
  mount_uploader :picture, PictureUploader

  validates :album_id, presence: true

  belongs_to :album
end
