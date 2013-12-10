class UserAbility
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    case user
      when user.class == Company
        can :read, :all
        can :create, :all
        can :edit, [Question, Answer, Comment] do |post|
          post.user == user
        end
        can :update, [Question, Answer, Comment] do |post|
          post.user == user
        end
        can :destroy, [Question, Answer, Comment] do |post|
          post.user == user
        end
      when user.class == "User"
        if user.role == 'admin'
        can :manage, :all
    
        elsif user.role == "user" || "mentor"
          can :read, :all

          can :create, [Question, Answer, Comment]
          can :edit, [Question, Answer, Comment] do |post|
            post.user == user
          end
          can :update, [Question, Answer, Comment] do |post|
            post.user == user
          end
          can :destroy, [Question, Answer, Comment] do |post|
            post.user == user
          end
        else
          can :read, :all
          can :create, User
        end
    end
end
