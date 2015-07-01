class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    if user.admin?
        # admin user can manage everything
        can :manage, :all
    else
        # all non-admin users can see everything
        can :read, :all
        if !user.id.nil?
            # logged in user can update their profile
            can :update, User, :id => user.id
            # and create/edit/delete their children
            can [:create, :update, :destroy], Child, :user_id => user.id
            # can update their vaccinations
            can :update, Vaccination
        end
    end
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

    # nobody can destroy a vaccine or a vaccination, its pretty complicated
    cannot :destroy, [Vaccination, Vaccine]
  end
end
