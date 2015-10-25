class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :parent
      can :manage :all
    else
      can :read, :all
      can :create, Comment
      can :update, Comment do |comment|
        comment.try(:user) == user || user.role?(:parent)
      end
    end
  end
end
