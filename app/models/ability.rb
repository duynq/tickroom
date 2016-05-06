class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.normal?
      can [:show, :edit], User, id: user.id
      can :manage, Photo
      can :manage, Room
      can :manage, Favorite
      can :manage, Comment
    elsif user.host?
      can :manage, Photo
      can :manage, Room, user_id: user.id
      can :manage, Comment
    else
      can :read, Room
    end
  end
end
