class AnswerVote < ActiveRecord::Base

  belongs_to :owner, :polymorphic => true
  belongs_to :answer
  attr_accessible :vote, :owner_id, :owner_type

end