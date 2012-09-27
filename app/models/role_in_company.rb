class RoleInCompany < ActiveRecord::Base
  set_table_name :roles_in_company

  attr_accessible :company_id, :name, :description

  validates_presence_of :name
  validates_uniqueness_of :name
  belongs_to :company
end
