class AlbumPolicy < BasePolicy
  def update?
    @record.user == @user
  end

  def edit?
    update?
  end
end
