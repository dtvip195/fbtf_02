class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.user?
      can :create, Comment
      can :create, Review
      can :update, Review, user_id: user.id
      can :destroy, Comment, user_id: user.id
      can :destroy, Review, user_id: user.id
      can [:create, :destroy], Booking
      can [:create, :destroy], Like
    else
      can :read, :all
    end
  end
end
