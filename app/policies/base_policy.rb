class BasePolicy
  def initialize(user, object)
    @user = user
    @object = object
  end

  def authorized?(action)
    public_send("#{action}?")
  end

  %w[index show new create edit update].each do |name|
    define_method("#{name}?") do
      false
    end
  end
end
