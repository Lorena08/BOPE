class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
<<<<<<< HEAD
    # user ||= User.new # guest user (not logged in)
    if user.user_profile.role == "Total"
      can :manage, :all
    else
      can [:read, :update], UserProfile, id: user.id
      # can :update, UserProfile, id: user.id
      can :read, Team
      can :read, Project
      can :read, MacroActivity
      can :read, Sprint
      can :manage, Activity
    end
=======
    #   user ||= User.new # guest user (not logged in)
       if user.user_profile.role == "Total"
         can :manage, :all
       else
         can :read, :all
         can :update, User
       end
>>>>>>> d0c6183c3349cba16c54d8ce4c0fb5ee26c49700
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
