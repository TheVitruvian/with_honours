class CommentVote < ActiveRecord::Base

  belongs_to :owner, :polymorphic => true
  belongs_to :comment
  attr_accessible :vote, :owner_id, :owner_type

end