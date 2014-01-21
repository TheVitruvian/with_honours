class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :biography
  attr_accessible :degree_achieved, :degree_classification, :degree_score, :first_name, :last_name, :profile_picture, :role, :user_name, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :provider, :uid, :university_id, :degree_title

  belongs_to :university

  has_many :messages_sent, :class_name => 'Message',        as: :owner
  has_many :messages_received, :class_name => 'Message',    as: :recipient
  has_many :questions,                                      as: :owner
  has_many :answers,                                        as: :owner
  has_many :comments,                                       as: :owner
  has_many :question_votes,                                 as: :owner
  has_many :answer_votes,                                   as: :owner
  has_many :comment_votes,                                  as: :owner

  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  mount_uploader :profile_picture, ImageUploader

#MESSAGING
  def all_messages
    [self.messages_sent, self.messages_received].flatten
  end

  def messages_with_other other_owner_id, other_owner_type
    sent     = self.messages_sent.where("recipient_id = ?", other_owner_id).where("recipient_type = ?", other_owner_type)
    received = self.messages_received.where("owner_id = ?", other_owner_id).where("owner_type = ?", other_owner_type)
    [sent, received].flatten.sort_by(&:created_at)
  end

  def contact_list
      companies_contacted, users_contacted = contacted
      companies_in_touch, users_in_touch = contacted_by
      user_inbox_display = User.find_all_by_id [users_contacted, users_in_touch]
      company_inbox_display = Company.find_all_by_id [companies_contacted, companies_in_touch]

      return user_inbox_display, company_inbox_display
  end

  def contacted
    companies_contacted = []
    users_contacted = []
    self.messages_sent.map { |m| if m.recipient_type == "Company" then companies_contacted << m.recipient_id else users_contacted << m.recipient_id end} 
    return companies_contacted, users_contacted
  end

  def contacted_by
    companies_in_touch = []
    users_in_touch = []
    self.messages_received.map { |m| if m.recipient_type == "Company" then companies_in_touch << m.recipient_id else users_in_touch << m.recipient_id end }  # Returns ids of users/companies who've messaged this user
    return companies_in_touch, users_in_touch
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
