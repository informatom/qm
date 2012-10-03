class BusinessProcessDocumentAssignment < ActiveRecord::Base
  attr_accessible :business_process_id, :company_id, :document_id

  validates_presence_of :document_id
  validates_presence_of :business_process_id
  validates_uniqueness_of :document_id, :scope => :business_process_id
  validates_presence_of :company_id

  belongs_to :business_process
  belongs_to :document
  belongs_to :company
end
