class Substitution < ActiveRecord::Base
  attr_accessible :deputy_id, :user_id

  validates_presence_of :deputy_id
  validates_presence_of :user_id
  validates_uniqueness_of :deputy_id, :scope => :user_id

  belongs_to :user
  belongs_to :deputy
end
