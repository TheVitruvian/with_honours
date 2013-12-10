class Question < ActiveRecord::Base

  belongs_to :owner, :polymorphic => true
  has_many :question_votes, before_add: :check_if_voted, after_add: :adjust_question_score
  has_many :answers

  attr_accessible :content, :owner_id, :owner_type, :title, :image, :flag,  

  validates :title, presence: true
  validates :content, presence: true


  def adjust_question_score(vote)
    #adjust question score according to vote cast
    #use Question.sum("upvotes")?
  end

  def check_if_voted()
    #check where question_votes against current_user or current_company.
    user_or_company = current_user.id||= current_company.id
    Question_votes.where("current_#{user_or_company.downcase}.id").empty?
  end

end