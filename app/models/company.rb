class Company < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :users, :through => :employments, :dependent => :restrict
  has_many :substitutions, :dependent => :restrict
  has_many :employments, :dependent => :restrict

  has_many :departments, :dependent => :restrict
  has_many :department_affiliations, :dependent => :restrict
  has_many :business_process_department_assignments, :dependent => :restrict

  has_many :functions, :dependent => :restrict
  has_many :user_function_assignments, :dependent => :restrict

  has_many :roles_in_company, :dependent => :restrict
  has_many :user_role_in_company_assignments, :dependent => :restrict

  has_many :processclasses, :dependent => :restrict
  has_many :business_processes, :dependent => :restrict

  has_many :notes, :dependent => :restrict
  has_many :business_process_note_assignments, :dependent => :restrict

  has_many :documents, :dependent => :restrict
  has_many :business_process_document_assignments, :dependent => :restrict

  has_many :process_indicators, :dependent => :restrict
  has_many :business_process_process_indicator_assignments, :dependent => :restrict

  has_many :instructions, :dependent => :restrict
end
