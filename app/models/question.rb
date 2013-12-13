class Question < ActiveRecord::Base

  belongs_to :owner, :polymorphic => true
  has_many :question_votes
  has_many :answers

  attr_accessible :content, :owner_id, :owner_type, :title, :image, :flag  

  validates :title, presence: true
  validates :content, presence: true

  mount_uploader :image, ImageUploader

end