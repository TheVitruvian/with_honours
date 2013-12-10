class University < ActiveRecord::Base
  
  attr_accessible :content, :owner_id, :owner_type, :title, :image, :flag 
  has_many :users
end