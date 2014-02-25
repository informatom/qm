class BusinessProcessDepartmentAssignment < ActiveRecord::Base
  has_paper_trail

  attr_accessible :business_process_id, :company_id, :department_id

  validates_presence_of :department
  validates_presence_of :business_process
  validates_uniqueness_of :department_id, :scope => :business_process_id
  validates_presence_of :company_id

  belongs_to :business_process, :inverse_of => :business_process_department_assignments
  belongs_to :department, :inverse_of => :business_process_department_assignments
  belongs_to :company, :inverse_of => :business_process_department_assignments
end