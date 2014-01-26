class Document < ActiveRecord::Base
  has_paper_trail

  mount_uploader :attachment, AttachmentUploader
  attr_accessible :company_id, :description, :internal, :name, :attachment, :remove_attachment,
                  :business_process_document_assignments_attributes,
                  :instruction_document_assignments_attributes,
                  :document_process_step_assignments_attributes, :released_by_id, :controlled_by_id

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :company_id
  validates_presence_of :controlled_by
  validates_presence_of :released_by

  belongs_to :company
  belongs_to :controlled_by, :class_name => "User"
  belongs_to :released_by, :class_name => "User"

  has_many :business_process_document_assignments, :dependent => :restrict, :inverse_of => :document
  has_many :business_processes, :through => :business_process_document_assignments, :dependent => :restrict
  accepts_nested_attributes_for :business_process_document_assignments, :allow_destroy => true

  has_many :instruction_document_assignments, :dependent => :restrict, :inverse_of => :document
  has_many :instructions, :through => :instruction_document_assignments, :dependent => :restrict
  accepts_nested_attributes_for :instruction_document_assignments, :allow_destroy => true

  has_many :document_process_step_assignments, :dependent => :restrict, :inverse_of => :document
  has_many :process_steps, :through => :document_process_step_assignments, :dependent => :restrict
  accepts_nested_attributes_for :document_process_step_assignments, :allow_destroy => true
end