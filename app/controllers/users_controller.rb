class UsersController < ApplicationController
  def albums
    @user = User.find_by_user_name(params[:user_name])

    if @user
      @albums = @user.top_level_albums.order(title: :asc)
    else
      redirect_to root_path, alert: "Пользователь #{params[:user_name]} не найден!"
    end
  end
end
