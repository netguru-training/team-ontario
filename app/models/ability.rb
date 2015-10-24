class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :parent
      can :manage, Family do |family|
        family.try(:user) == user
      end
      can :manage, Event do |event|
        user.family == event.family
      end
      can :manage, Comment do |comment|
        comment.try(:user) == user
      end


    else
      can :read, :all
      can :craete, Comment
      can :update, Comment do |comment|
        comment.try(:user) == user || user.role?(:parent)
      end
    end
end
