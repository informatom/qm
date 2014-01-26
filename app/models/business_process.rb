class BusinessProcess < ActiveRecord::Base
  has_ancestry
  has_paper_trail

  attr_accessible :aims, :ancestry, :company_id, :description, :name, :number, :owner_id, :parent_id, :process_class_id, :purpose,
                  :x, :y, :area,
                  :business_process_note_assignments_attributes,
                  :business_process_document_assignments_attributes,
                  :business_process_process_indicator_assignments_attributes,
                  :business_process_department_assignments_attributes, :released_by_id, :controlled_by_id

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :company_id
  validates_presence_of :process_class_id
  validates_presence_of :controlled_by
  validates_presence_of :released_by

  belongs_to :company
  belongs_to :process_class
  belongs_to :owner, :class_name => "User"
  belongs_to :controlled_by, :class_name => "User"
  belongs_to :released_by, :class_name => "User"

  has_many :business_process_note_assignments, :dependent => :restrict, :inverse_of => :business_process
  has_many :notes, :through => :business_process_note_assignments, :dependent => :restrict
  accepts_nested_attributes_for :business_process_note_assignments, :allow_destroy => true

  has_many :business_process_document_assignments, :dependent => :restrict, :inverse_of => :business_process
  has_many :documents, :through => :business_process_document_assignments, :dependent => :restrict
  accepts_nested_attributes_for :business_process_document_assignments, :allow_destroy => true

  has_many :business_process_process_indicator_assignments, :dependent => :restrict, :inverse_of => :business_process
  has_many :process_indicators, :through => :business_process_process_indicator_assignments, :dependent => :restrict
  accepts_nested_attributes_for :business_process_process_indicator_assignments, :allow_destroy => true

  has_many :business_process_department_assignments, :dependent => :restrict, :inverse_of => :business_process
  has_many :departments, :through => :business_process_department_assignments, :dependent => :restrict
  accepts_nested_attributes_for :business_process_department_assignments, :allow_destroy => true

  has_many :process_steps
end
