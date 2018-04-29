class AlbumPolicy < BasePolicy
  def edit?
    @object.user == @user
  end

  def destroy?
    @object.user == @user
  end
end
