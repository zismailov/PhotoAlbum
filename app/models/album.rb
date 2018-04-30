class Album < ApplicationRecord
  validates :title, :user_id, presence: true
  validates :title, uniqueness: { scope: :user_id, message: "has already been taken" }

  belongs_to :user
  belongs_to :parent_album, class_name: "Album", optional: true

  has_many :child_albums, class_name: "Album", foreign_key: "parent_album_id"
  has_many :photos

  serialize :photos_order, Array

  scope :ordered_by_title, -> { order(title: :asc) }
end
