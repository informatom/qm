class BusinessProcessNoteAssignment < ActiveRecord::Base
  has_paper_trail

  attr_accessible :business_process_id, :company_id, :note_id

  validates_presence_of :note
  validates_presence_of :business_process
  validates_uniqueness_of :note_id, :scope => :business_process_id
  validates_presence_of :company_id

  belongs_to :business_process, :inverse_of => :business_process_note_assignments
  belongs_to :note, :inverse_of => :business_process_note_assignments
  belongs_to :company, :inverse_of => :business_process_note_assignments
end
