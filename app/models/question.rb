class Question < ActiveRecord::Base

  belongs_to :owner, :polymorphic => true
  has_many :question_votes, before_add: :check_if_voted, after_add: :adjust_question_score
  has_many :answers

  attr_accessible :content, :owner_id, :owner_type, :title, :image, :flag  

  validates :title, presence: true
  validates :content, presence: true

  mount_uploader :image, ImageUploader


  def adjust_question_score()
    #adjust question score according to vote cast
    Question.sum("upvotes")
  end

  def check_if_voted()
    #check where question_votes against current_user or current_company.
    #Question_votes.where("current_agent.id").empty?
  end

end