class Album < ApplicationRecord
  validates :title, :user_id, presence: true
  validates :title, uniqueness: { scope: :user_id, message: "has already been taken" }

  belongs_to :user
  belongs_to :parent_album, class_name: "Album"

  has_many :child_albums, class_name: "Album", foreign_key: "parent_album_id"
  has_many :photos

  scope :root, -> { where(parent_album_id: nil) }

  def random_photo
    photos.order("RANDOM()").first
  end

  def top_level_album?
    parent_album_id.nil?
  end

  def completely_empty?
    photos.empty? && child_albums.empty?
  end

  def parents
    parents = []
    return if top_level_album?

    some_parent = parent_album

    until some_parent.top_level_album?
      parents << some_parent
      some_parent = some_parent.parent_album
    end
    parents << some_parent

    parents.reverse
  end
end
