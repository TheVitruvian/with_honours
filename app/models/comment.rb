class Comment < ActiveRecord::Base
  
  belongs_to :owner, :polymorphic => true
  belongs_to :answer

  attr_accessible :content, :flag, :owner_id, :owner_type

  validates :content, presence: true
end