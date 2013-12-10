class Answer < ActiveRecord::Base
  
  belongs_to :owner, :polymorphic => true
  belongs_to :question
  attr_accessible :content, :flag, :owner_id, :owner_type
end