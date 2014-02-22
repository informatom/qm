class UserRoleInCompanyAssignment < ActiveRecord::Base
  has_paper_trail

  attr_accessible :role_in_company_id, :user_id, :company_id

  validates_presence_of :role_in_company
  validates_presence_of :user
  validates_uniqueness_of :role_in_company_id, :scope => :user_id
  validates_presence_of :company_id

  belongs_to :role_in_company, :inverse_of => :user_role_in_company_assignments
  belongs_to :user, :inverse_of => :user_role_in_company_assignments
  belongs_to :company, :inverse_of => :user_role_in_company_assignments
end
