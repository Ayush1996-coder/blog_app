class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
  end

  if user.role?(:admin)
    can :manage, :all
  end
end
