class Question < ActiveRecord::Base

  belongs_to :owner, :polymorphic => true
  has_many :question_votes, before_add: :check_if_voted, after_add: :adjust_question_score
  has_many :answers

  attr_accessible :content, :owner_id, :owner_type, :title, :image, :flag 

  validates :title, presence: true
  validates :content, presence: true


  def adjust_question_score(vote)
    #adjust question score according to vote cast
  end

  def check_if_voted(vote)
    #check it voted prior to add 
  end

end