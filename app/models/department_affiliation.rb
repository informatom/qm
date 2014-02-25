class DepartmentAffiliation < ActiveRecord::Base
  has_paper_trail

  attr_accessible :department_id, :user_id, :company_id

  validates_presence_of :department
  validates_presence_of :user
  validates_uniqueness_of :department_id, :scope => :user_id

  belongs_to :user, :inverse_of => :department_affiliations
  belongs_to :department, :inverse_of => :department_affiliations
  belongs_to :company, :inverse_of => :department_affiliations
end