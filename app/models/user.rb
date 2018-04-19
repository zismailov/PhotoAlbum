class User < ApplicationRecord
  devise :confirmable, :database_authenticatable, :registerable, :lockable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :albums, dependent: :destroy

  LOCALES = [
    %w[Русский ru],
    %w[English en]
  ].freeze

  def top_level_albums
    albums.where(parent_album_id: nil).includes(:child_albums)
  end

  def admin?
    role == "admin"
  end
end
