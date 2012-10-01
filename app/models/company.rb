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

  has_many :roles_in_company
end
