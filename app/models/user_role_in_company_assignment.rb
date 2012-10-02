class UserRoleInCompanyAssignment < ActiveRecord::Base
  attr_accessible :role_in_company_id, :user_id, :company_id

  validates_presence_of :role_in_company_id
  validates_presence_of :user_id
  validates_uniqueness_of :role_in_company_id, :scope => :user_id

  belongs_to :role_in_company
  belongs_to :user
  belongs_to :company
end
