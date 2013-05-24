class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :surveys, :foreign_key => "creator_id"
  has_many :choices_users, :foreign_key => "voter_id"
  has_many :questions, :through => :choices
  
end
