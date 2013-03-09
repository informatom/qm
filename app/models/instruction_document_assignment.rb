class InstructionDocumentAssignment < ActiveRecord::Base
  attr_accessible :company_id, :document_id, :instruction_id

  validates_presence_of :instruction_id
  validates_presence_of :document_id
  validates_uniqueness_of :instruction_id, :scope => :document_id
  validates_presence_of :company_id

  belongs_to :instruction
  belongs_to :document
  belongs_to :company
end