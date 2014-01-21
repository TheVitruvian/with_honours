class Message < ActiveRecord::Base

  belongs_to :owner, :polymorphic => true
  belongs_to :recipient, :polymorphic => true

  attr_accessible :owner, :recipient, :content, :is_read, :is_archived, :created_at, :subject, :owner_id, :owner_type, :recipient_id, :recipient_type

end