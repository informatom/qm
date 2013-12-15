class DepartmentAffiliation < ActiveRecord::Base
  has_paper_trail

  attr_accessible :department_id, :user_id, :company_id

  validates_presence_of :department
  validates_presence_of :user
  validates_uniqueness_of :department_id, :scope => :user_id

  belongs_to :user
  belongs_to :department
  belongs_to :company
end
