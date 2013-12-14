class Question < ActiveRecord::Base

  belongs_to :owner, :polymorphic => true
  has_many :question_votes
  has_many :answers

  attr_accessible :content, :owner_id, :owner_type, :title, :image, :flag, :hotness, :category

  validates :title, presence: true
  
  after_save :update_hotness

  mount_uploader :image, ImageUploader

  def update_hotness
    self.hotness = (self.up_votes_count - self.down_votes_count) / (Time.now - self.created_at)**1.5
  end

end