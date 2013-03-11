class DocumentProcessStepAssignment < ActiveRecord::Base
  attr_accessible :company_id, :document_id, :process_step_id

  validates_presence_of :document_id
  validates_presence_of :process_step_id
  validates_uniqueness_of :document_id, :scope => :process_step_id
  validates_presence_of :company_id

  belongs_to :document
  belongs_to :process_step
  belongs_to :company
end
