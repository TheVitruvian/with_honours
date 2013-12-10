class Company < ActiveRecord::Base

  attr_accessible :user_name, :biography, :logo, :email

  has_many :questions, as: :owner
  has_many :answers, as: :owner
  has_many :comments, as: :owner

  validates :user_name, presence: true, uniqueness: true
end