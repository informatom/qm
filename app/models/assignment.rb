class Assignment < ActiveRecord::Base
  has_paper_trail

  attr_accessible :role_id, :user_id

  validates_presence_of :role
  validates_presence_of :user
  validates_uniqueness_of :role_id, :scope => :user_id

  belongs_to :user
  belongs_to :role
end
