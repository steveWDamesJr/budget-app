class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Purchase
    can :read, Group
    return unless user.present?

    can :manage, Purchase, user: user
    can :manage, Group, user: user
  end
end
