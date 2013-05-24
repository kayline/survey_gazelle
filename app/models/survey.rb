class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :creator, :class_name => "User"
  has_many :questions
  has_many :choices, :through => :questions
end
