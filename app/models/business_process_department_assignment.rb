class BusinessProcessDepartmentAssignment < ActiveRecord::Base
  attr_accessible :business_process_id, :company_id, :department_id

  validates_presence_of :department
  validates_presence_of :business_process
  validates_uniqueness_of :department_id, :scope => :business_process_id
  validates_presence_of :company_id

  belongs_to :business_process
  belongs_to :department
  belongs_to :company
end
