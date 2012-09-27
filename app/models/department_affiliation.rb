class DepartmentAffiliation < ActiveRecord::Base
  attr_accessible :department_id, :user_id

  validates_presence_of :department_id
  validates_presence_of :user_id
  validates_uniqueness_of :department_id, :scope => :user_id

  belongs_to :user
  belongs_to :department
end