class UserAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
      if user.role == 'admin'
      can :manage, :all
  
      elsif user.role == "user"
        can :read, :all

        can :create, [Question, Answer, Comment]
        can [ :edit, :update, :destroy ], [Question, Answer, Comment] do |post|
          post.owner == user
      end
      else
        can :read, :all
        can :create, User
      end
  end
end
