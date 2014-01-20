class Company < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :user_name, :biography, :logo

  has_many :messages_sent, :class_name => 'Message',        as: :owner
  has_many :messages_received, :class_name => 'Message',    as: :recipient
  has_many :questions,            as: :owner
  has_many :answers,              as: :owner
  has_many :comments,             as: :owner
  has_many :question_votes,       as: :owner
  has_many :answer_votes,         as: :owner
  has_many :comment_votes,        as: :owner

  validates :user_name, presence: true, uniqueness: true
  validates :email,     presence: true, uniqueness: true

  mount_uploader :logo, ImageUploader

#MESSAGING
  def all_messages
    [self.messages_sent, self.messages_received].flatten
  end

  def messages_with_other other_owner_id
    sent     = self.messages_sent.where(owner.id == other_owner_id)
    received = self.messages_received.where(recipient_id == other_owner_id)
    [sent, received].flatten.sort_by(&:created_at)
  end

  def contact_list
    User.find_all_by_id [contacted, contacted_by]
  end

  def contacted
    self.messages_sent.pluck(:recipient_id)   # Returns ids of users/companies has user has sent messages to
  end

  def contacted_by
    self.messages_received.pluck(:owner_id)  # Returns ids of users/companies who've messaged this user
  end

#VOTING
  def question_votes_identifier(current_agent)
    up_votes_cast, down_votes_cast = [], []

    current_agent.question_votes.each do |id|
      if id.vote > 0
        up_votes_cast <<  id.question_id  
      else
        down_votes_cast << id.question_id
      end
    end
    return up_votes_cast, down_votes_cast
  end

  def answer_votes_identifier(current_agent)
    answer_up_votes_cast, answer_down_votes_cast = [], []

    current_agent.answer_votes.each do |id|
      if id.vote > 0
        answer_up_votes_cast <<  id.answer_id  
      else
        answer_down_votes_cast << id.answer_id
      end
    end
    return answer_up_votes_cast, answer_down_votes_cast
  end

  def comment_votes_identifier(current_agent)
    comment_up_votes_cast, comment_down_votes_cast = [], []

    current_agent.comment_votes.each do |id|
      if id.vote > 0
        comment_up_votes_cast <<  id.comment_id  
      else
        comment_down_votes_cast << id.comment_id
      end
    end
    return comment_up_votes_cast, comment_down_votes_cast
  end

  def votes_counter(current_agent)
    current_agent.question_votes.count + current_agent.answer_votes.count + current_agent.comment_votes.count
  end
end
