class RoleInCompany < ActiveRecord::Base
  set_table_name :roles_in_company

  attr_accessible :company_id, :name, :description

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :company_id

  belongs_to :company

  has_many :user_role_in_company_assignments, :dependent => :restrict
  has_many :users, :through => :user_role_in_company_assignments, :dependent => :restrict
end
