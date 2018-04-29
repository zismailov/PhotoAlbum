class UsersController < ApplicationController
  expose(:user)

  def albums
    @albums = user.top_level_albums.order(title: :asc)
  end
end
