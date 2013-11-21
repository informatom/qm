class BusinessProcessNoteAssignment < ActiveRecord::Base
  attr_accessible :business_process_id, :company_id, :note_id

  validates_presence_of :note
  validates_presence_of :business_process
  validates_uniqueness_of :note_id, :scope => :business_process_id
  validates_presence_of :company_id

  belongs_to :business_process
  belongs_to :note
  belongs_to :company
end
