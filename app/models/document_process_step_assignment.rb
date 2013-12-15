class DocumentProcessStepAssignment < ActiveRecord::Base
  has_paper_trail

  attr_accessible :company_id, :document_id, :process_step_id

  validates_presence_of :document
  validates_presence_of :process_step
  validates_uniqueness_of :document_id, :scope => :process_step_id
  validates_presence_of :company_id

  belongs_to :document
  belongs_to :process_step
  belongs_to :company
end
