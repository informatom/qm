class BusinessProcessDocumentAssignment < ActiveRecord::Base
  has_paper_trail

  attr_accessible :business_process_id, :company_id, :document_id

  validates_presence_of :document
  validates_presence_of :business_process
  validates_uniqueness_of :document_id, :scope => :business_process_id
  validates_presence_of :company_id

  belongs_to :business_process, :inverse_of => :business_process_document_assignments
  belongs_to :document, :inverse_of => :business_process_document_assignments
  belongs_to :company, :inverse_of => :business_process_document_assignments
end
