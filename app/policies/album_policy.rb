class AlbumPolicy < ApplicationPolicy
  def destroy?
    @object.user == current_user
  end
end
