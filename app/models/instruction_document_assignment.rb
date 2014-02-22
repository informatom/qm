class InstructionDocumentAssignment < ActiveRecord::Base
  has_paper_trail

  attr_accessible :company_id, :document_id, :instruction_id

  validates_presence_of :instruction
  validates_presence_of :document
  validates_uniqueness_of :instruction_id, :scope => :document_id
  validates_presence_of :company_id

  belongs_to :instruction, :inverse_of => :instruction_document_assignments
  belongs_to :document, :inverse_of => :instruction_document_assignments
  belongs_to :company, :inverse_of => :instruction_document_assignments
end