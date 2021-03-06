class NoteProcessStepAssignment < ActiveRecord::Base
  has_paper_trail

  attr_accessible :company_id, :note_id, :process_step_id

  validates_presence_of :note
  validates_presence_of :process_step
  validates_uniqueness_of :note_id, :scope => :process_step_id
  validates_presence_of :company_id

  belongs_to :note, :inverse_of => :note_process_step_assignments
  belongs_to :process_step, :inverse_of => :note_process_step_assignments
  belongs_to :company, :inverse_of => :note_process_step_assignments
end
