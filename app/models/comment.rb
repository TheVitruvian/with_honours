class Comment < ActiveRecord::Base
  
  belongs_to :owner, :polymorphic => true

  attr_accessible :content, :flag, :owner_id, :owner_type
end