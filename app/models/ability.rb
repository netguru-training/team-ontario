class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :parent
      can :manage, :all
    else
      can :read, :all
end
  end
end
