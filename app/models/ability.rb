class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.normal?
      can :show, User
      can :manage, Photo
      can :manage, Room, user_id: user.id
    else
      can :show, Room
    end
  end
end
