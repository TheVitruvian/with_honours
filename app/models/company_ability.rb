class CompanyAbility
  include CanCan::Ability

  def initialize(company)
    if company
      can :read, :all
      can :vote, :all
      can :create, [Question, Answer, Comment]
      can [ :edit, :update, :destroy ], [Question, Answer, Comment] do |post|
        post.owner == company
      end
    else
      can :read, :all
      can :create, User
      can :create, Company 
    end
  end
end