class Company < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  attr_accessible :user_name, :biography, :logo

  has_many :questions,      as: :owner
  has_many :answers,        as: :owner
  has_many :comments,       as: :owner
  has_many :question_votes, as: :owner
  has_many :answer_votes,   as: :owner
  has_many :comment_votes,  as: :owner

  validates :user_name, presence: true, uniqueness: true
  validates :email,     presence: true, uniqueness: true

  mount_uploader :logo, ImageUploader

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
