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

  mount_uploader :logo, ImageUploader
end
