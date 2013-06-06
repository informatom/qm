class Department < ActiveRecord::Base
  attr_accessible :company_id, :name, :x, :y

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :company_id

  belongs_to :company
  has_many :department_affiliations, :dependent => :restrict
  has_many :users, :through => :department_affiliations, :dependent => :restrict

  has_many :business_process_department_assignments, :dependent => :restrict
  has_many :business_processes, :through => :business_process_department_assignments, :dependent => :restrict

  has_many :instructions, :dependent => :restrict, :foreign_key => "scope_id"
end
