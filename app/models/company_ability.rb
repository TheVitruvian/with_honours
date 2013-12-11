class CompanyAbility
  include CanCan::Ability

  def initialize(company)
    can :read, :all
    can :create, [Question, Answer, Comment]
    can [ :edit, :update, :destroy ], [Question, Answer, Comment] do |post|
      post.owner == company
    end
  end
end