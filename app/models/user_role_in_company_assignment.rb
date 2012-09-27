class UserRoleInCompanyAssignment < ActiveRecord::Base
  attr_accessible :role_in_company_id, :user_id

  belongs_to :role_in_company
  belongs_to :user
end
