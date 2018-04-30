class User < ApplicationRecord
  devise :confirmable, :database_authenticatable, :registerable, :lockable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :albums, dependent: :destroy
  has_many :photos, through: :albums

  LOCALES = [
    %w[Русский ru],
    %w[English en]
  ].freeze

  def top_level_albums
    albums.ordered_by_title.where(parent_album_id: nil).includes(:child_albums)
  end

  def administrator?
    role == "administrator"
  end
end
