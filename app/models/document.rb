class Document < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  attr_accessible :company_id, :description, :internal, :name, :attachment, :remove_attachment

  validates_presence_of :name
  validates_uniqueness_of :name, :scope => :company_id

  belongs_to :company

  has_many :business_process_document_assignments, :dependent => :restrict
  has_many :business_processes, :through => :business_process_document_assignments, :dependent => :restrict

  has_many :instruction_document_assignments, :dependent => :restrict
  has_many :instructions, :through => :instruction_document_assignments, :dependent => :restrict

  has_many :document_process_step_assignments, :dependent => :restrict
  has_many :documents, :through => :document_process_step_assignments, :dependent => :restrict
end