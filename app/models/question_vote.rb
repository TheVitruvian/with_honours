class QuestionVote < ActiveRecord::Base

  belongs_to :owner, :polymorphic => true
  belongs_to :question
  attr_accessible :vote, :owner_id, :owner_type, :question_id


  
end