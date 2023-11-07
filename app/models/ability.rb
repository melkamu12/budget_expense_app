class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      can :manage, Category, author_id: user.id
      can :manage, Expense, user_id: user.id
    end
  end
end
