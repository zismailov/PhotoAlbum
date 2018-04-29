class PhotoPolicy < BasePolicy
  def edit?
    photo_belongs_to_current_user?
  end

  def destroy?
    photo_belongs_to_current_user?
  end

  def photo_belongs_to_current_user?
    @object.album.user == @user
  end
end
