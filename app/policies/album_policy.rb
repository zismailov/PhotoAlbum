class AlbumPolicy < BasePolicy
  def destroy?
    @object.user == current_user
  end
end
