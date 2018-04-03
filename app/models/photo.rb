class Photo < ApplicationRecord
  validates :album_id, presence: true

  belongs_to :album
end
