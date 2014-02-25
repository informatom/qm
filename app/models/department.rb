class Department < ActiveRecord::Base
  has_paper_trail

  attr_accessible :company_id, :name, :x, :y,
                  :business_process_department_assignments_attributes,
                  :department_affiliations_attributes

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :company_id

  belongs_to :company, :inverse_of => :departments
  has_many :department_affiliations, :dependent => :restrict, :inverse_of => :department
  has_many :users, :through => :department_affiliations, :dependent => :restrict, :inverse_of => :departments
  accepts_nested_attributes_for :department_affiliations, :allow_destroy => true

  has_many :business_process_department_assignments, :dependent => :restrict, :inverse_of => :department
  has_many :business_processes, :through => :business_process_department_assignments, :dependent => :restrict, :inverse_of => :departments
  accepts_nested_attributes_for :business_process_department_assignments, :allow_destroy => true

  has_many :instructions, :dependent => :restrict, :foreign_key => "scope_id", :inverse_of => :scope
end