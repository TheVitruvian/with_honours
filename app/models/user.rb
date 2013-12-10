class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :degree_achieved, :degree_classification, :degree_score, :first_name, :last_name, :profile_picture, :role, :user_name, :reset_password_token, :reset_password_sent_at, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :confirmed_at, :confirmation_sent_at, :unconfirmed_email, :provider, :uid

  belongs_to :university
  has_many :questions, as: :owner
  has_many :answers, as: :owner
  has_many :comments, as: :owner

  validates :user_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

end
