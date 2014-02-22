class Company < ActiveRecord::Base
  has_paper_trail

  attr_accessible :name, :employments_attributes

  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :users, :through => :employments, :dependent => :restrict, :inverse_of => :companies
  has_many :substitutions, :dependent => :restrict, :inverse_of => :company

  has_many :employments, :dependent => :restrict, :inverse_of => :company
  accepts_nested_attributes_for :employments, :allow_destroy => true

  has_many :departments, :dependent => :restrict, :inverse_of => :company
  has_many :department_affiliations, :dependent => :restrict, :inverse_of => :company
  has_many :business_process_department_assignments, :dependent => :restrict, :inverse_of => :company

  has_many :functions, :dependent => :restrict, :inverse_of => :company
  has_many :user_function_assignments, :dependent => :restrict, :inverse_of => :company

  has_many :roles_in_company, :dependent => :restrict, :inverse_of => :company
  has_many :user_role_in_company_assignments, :dependent => :restrict, :inverse_of => :company

  has_many :process_classes, :dependent => :restrict, :inverse_of => :company
  has_many :business_processes, :dependent => :restrict, :inverse_of => :company

  has_many :process_steps, :dependent => :restrict, :inverse_of => :company
  has_many :sequence_flows, :dependent => :restrict, :inverse_of => :company

  has_many :notes, :dependent => :restrict, :inverse_of => :company
  has_many :business_process_note_assignments, :dependent => :restrict, :inverse_of => :company
  has_many :note_process_step_assignments, :dependent => :restrict, :inverse_of => :company

  has_many :documents, :dependent => :restrict, :inverse_of => :company
  has_many :business_process_document_assignments, :dependent => :restrict, :inverse_of => :company
  has_many :document_process_step_assignments, :dependent => :restrict, :inverse_of => :company

  has_many :process_indicators, :dependent => :restrict, :inverse_of => :company
  has_many :business_process_process_indicator_assignments, :dependent => :restrict, :inverse_of => :company

  has_many :instructions, :dependent => :restrict, :inverse_of => :company
  has_many :instruction_process_step_assignments, :dependent => :restrict, :inverse_of => :company
  has_many :instruction_document_assignments, :dependent => :restrict, :inverse_of => :company

  amoeba do
    enable
    exclude_field [:users]
  end
end