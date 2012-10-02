class Company < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :employments
  has_many :users, :through => :employments, :dependent => :restrict

  has_many :substitutions

  has_many :departments
  has_many :department_affiliations

  has_many :functions
  has_many :user_function_assignments

  has_many :roles_in_company
  has_many :user_role_in_company_assignments
end
