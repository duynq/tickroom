class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.normal?
      can :show, User
    end
  end
end
